<?php
/**
 * ContratoDashboard TSession::getValue('unit_database')
 *
 * @version    2.0
 * @package    Sistema Integrado
 * @subpackage Módulos
 * @author     Jairo Barreto
 * @copyright  Copyright (c) 2021 Nativus Tecnologia. (http://www.nativustecnologia.com.br)
 * 
 */
class ContaReceberList extends TPage
{
    protected $form;     // registration form
    protected $datagrid; // listing
    protected $pageNavigation;
    protected $formgrid;
    protected $deleteButton;
    
    use Adianti\base\AdiantiStandardListTrait;
    
    /**
     * Page constructor
     */
    public function __construct()
    {
        parent::__construct();
        
        $this->setDatabase(TSession::getValue('unit_database'));            // defines the database
        $this->setActiveRecord('ContaReceber');   // defines the active record
        $this->setDefaultOrder('id', 'desc');         // defines the default order
        $this->setLimit(10);
        // $this->setCriteria($criteria) // define a standard filter

        $this->addFilterField('id', '=', 'id'); // filterField, operator, formField
        $this->addFilterField('pessoa_id', '=', 'pessoa_id'); // filterField, operator, formField
        $this->addFilterField('mes', '=', 'mes'); // filterField, operator, formField
        $this->addFilterField('ano', '=', 'ano'); // filterField, operator, formField

        $this->addFilterField('ativo', 'like', 'ativo'); // filterField, operator, formField
        
        $this->addFilterField('dt_emissao', '=', 'dt_emissao'); // filterField, operator, formField
        $this->addFilterField('dt_vencimento', '=', 'dt_vencimento'); // filterField, operator, formField
        $this->addFilterField('dt_pagamento', '=', 'dt_pagamento'); // filterField, operator, formField 

        $this->setOrderCommand('pessoa->nome_fantasia', '(SELECT nome_fantasia FROM pessoa WHERE pessoa.id=conta_receber.pessoa_id)');
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_search_ContaReceber');
        $this->form->setFormTitle('Contas a Receber');
        $this->form->enableCSRFProtection(); // ATIVA PROTEÇÃO CONTA EXECUÇÃO DE JAVA SCRIPT MALICIOSO
        

        // create the form fields
        $id = new TEntry('id');
        $pessoa_id = new TDBUniqueSearch('pessoa_id', TSession::getValue('unit_database'), 'Pessoa', 'id', 'nome_fantasia');
        $mes = new TRadioGroup('mes');
        $ano = new TRadioGroup('ano');

        $ativo = new TRadioGroup('ativo');
        
        $dt_emissao = new TDate('dt_emissao');
        $dt_vencimento = new TDate('dt_vencimento');
        $dt_pagamento = new TDate('dt_pagamento');
        
        $current = (int) date('Y');
        $mes->addItems( ['01' => 'Jan', '02' => 'Fev', '03' => 'Mar', '04' => 'Abr', '05' => 'Mai', '06' => 'Jun', '07' => 'Jul', '08' => 'Ago', '09' => 'Set', '10' => 'Out', '11' => 'Nov', '12' => 'Dez'] );
        $ano->addItems( [ ($current -5) => ($current -5), ($current -4) => ($current -4), ($current -3) => ($current -3), ($current -2) => ($current -2), ($current -1) => ($current -1), $current => $current ] );
        
        $mes->setLayout('horizontal');
        $ano->setLayout('horizontal');
        $pessoa_id->setMinLength(0);
        
        // add the fields
        $this->form->addFields( [ new TLabel('N°') ], [ $id ] );
        $this->form->addFields( [ new TLabel('Dt Emissão') ], [ $dt_emissao ], [ new TLabel('Dt Vencimento') ], [ $dt_vencimento ], [ new TLabel('Dt Pagamento') ], [ $dt_pagamento ] );
        $this->form->addFields( [ new TLabel('Cliente') ], [ $pessoa_id ] );
        $this->form->addFields( [ new TLabel('Mes') ], [ $mes ] );
        $this->form->addFields( [ new TLabel('Ano') ], [ $ano ] );
        $this->form->addFields( [ new TLabel('Cancelados') ], [ $ativo ] );


        // set sizes
        $id->setSize('100%');
        $pessoa_id->setSize('100%');

        $this->form->addExpandButton('Menu Pesquisa' , 'fa:search-dollar', false);
        $id->setMask('999999');

        $ativo->addItems( ['Y' => 'Sim', 'N' => 'Não', '' => 'Ambos'] );
        $ativo->setLayout('horizontal');
        $ativo->setSize('100%');

        // keep the form filled during navigation with session data
        $this->form->setData( TSession::getValue(__CLASS__.'_filter_data') );
        
        // add the search form actions
        $btn = $this->form->addAction(_t('Find'), new TAction([$this, 'onSearch']), 'fa:search');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addActionLink('Novo Recebimento', new TAction(['ReceberForm', 'onEdit'], ['register_state' => 'false']), 'fa:plus green');
        //$this->form->addActionLink('Recebimento Direto', new TAction(['ContaReceberForm', 'onEdit'], ['register_state' => 'false']), 'fa:money-bill-wave-alt green');
        
        
        // creates a Datagrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->style = 'width: 100%';
        // $this->datagrid->datatable = 'true';
        // $this->datagrid->enablePopover('Popover', 'Hi <b> {name} </b>');
        

        // creates the datagrid columns
        $column_id = new TDataGridColumn('id', 'N°', 'center', '10%');
        $column_pessoa_id = new TDataGridColumn('pessoa->nome_fantasia', 'Pessoa', 'left');
        $column_dt_emissao = new TDataGridColumn('dt_emissao', 'Emissao', 'left');
        $column_dt_vencimento = new TDataGridColumn('dt_vencimento', 'Vencimento', 'left');
        $column_dt_pagamento = new TDataGridColumn('dt_pagamento', 'Pagamento', 'left');
        $column_valor = new TDataGridColumn('valor', 'Valor', 'right');


        // add the columns to the DataGrid
        $this->datagrid->addColumn($column_id);
        $this->datagrid->addColumn($column_pessoa_id);
        $this->datagrid->addColumn($column_dt_emissao);
        $this->datagrid->addColumn($column_dt_vencimento);
        $this->datagrid->addColumn($column_dt_pagamento);
        $this->datagrid->addColumn($column_valor);

        // creates the datagrid column actions
        $column_id->setAction(new TAction([$this, 'onReload']), ['order' => 'id']);
        $column_pessoa_id->setAction(new TAction([$this, 'onReload']), ['order' => 'pessoa->nome_fantasia']);
        
        $column_dt_emissao->enableAutoHide(500);
        $column_dt_vencimento->enableAutoHide(500);
        $column_dt_pagamento->enableAutoHide(500);
        $column_valor->enableAutoHide(500);
        
        $column_id->setTransformer( function ($value, $object, $row) {
            if ($object->ativo == 'N')
            {
                $row->style= 'color: silver';
            }
            
            return $value;
        });
        
        $column_dt_emissao->setTransformer( function($value) {
            return TDate::convertToMask($value, 'yyyy-mm-dd', 'dd/mm/yyyy');
        });
        
        $column_dt_pagamento->setTransformer( function($value, $object) {
            if ($object->ativo == 'N')
            {
                return 'cancelada';
            }

            if( empty($object->dt_pagamento) AND $object->origem == 'C' )
            {
                $value = 'Aguardando Caixa';
                $label = "warning";
            }
            
            $pesq_fatura = FaturaContaReceber::where('conta_receber_id', '=', $object->id)->first();
            if ($pesq_fatura)
            {
                if ($value)
                {
                    $value = TDate::convertToMask($value, 'yyyy-mm-dd', 'dd/mm/yyyy');
                    $label = 'success';
                }
                else
                {
                    if ($pesq_fatura)
                    {
                        $fatura = Fatura::find($pesq_fatura->fatura_id);
                        if ($fatura)
                        {  
                            if( $object->valor !== $fatura->total){
                                $value = 'Fatura <b>nº ('.$fatura->id.')</b> Divergente';
                                $label = 'warning';
                            }
                            else{
                                $value = 'aguardando';
                                $label = 'warning';
                            }
                        }
                    }
                    
                }
            }
            
            $pesq_venda = VendaContaReceber::where('conta_receber_id', '=', $object->id)->first();
            if($pesq_venda)
            {
                if ($value)
                {
                    $value = TDate::convertToMask($value, 'yyyy-mm-dd', 'dd/mm/yyyy');
                    $label = 'success';
                }
                else
                {
                    if ($pesq_venda)
                    {
                        $fatura = Venda::find($pesq_venda->fatura_id);
                        if ($fatura)
                        {  
                            if( $object->valor !== $fatura->total){
                                $value = 'Vendaa <b>nº ('.$fatura->id.')</b> Divergente';
                                $label = 'warning';
                            }
                            else{
                                $value = 'aguardando';
                                $label = 'warning';
                            }
                        }
                    }
                    
                }
            }
            
            $pesq_recebimento = ContaReceberPg::where('recebimento_id', '=', $object->id)->first();
            if($pesq_recebimento)
            {
                if ($value)
                {
                    $value = TDate::convertToMask($value, 'yyyy-mm-dd', 'dd/mm/yyyy');
                    $label = 'success';
                }
                else
                {
                    if ($pesq_recebimento)
                    {
                        $contareceber = ContaReceber::find($pesq_recebimento->recebimento_id);
                        if ($contareceber)
                        {  
                            if( $object->origem == 'C'){
                                $value = 'aguardando pagamento';
                                $label = 'warning';
                            }
                            else{
                                $value = 'aguardando';
                                $label = 'warning';
                            }
                        }
                    }
                    
                }
            }
            
            $div = new TElement('span');

            if( empty($label) )
            {
                $value = 'null';
                $label = "danger";
            }

            $div->class="label label-" . $label;

            $div->style="text-shadow:none; font-size:12px";
            $div->add($value);
            return $div;
        });
        
        $column_dt_vencimento->setTransformer( function($value, $object) {
            $today = new DateTime(date('Y-m-d'));
            $end   = new DateTime($value);
            $data = TDate::convertToMask($value, 'yyyy-mm-dd', 'dd/mm/yyyy');
            
            if ($object->ativo == 'Y' && empty($object->dt_pagamento) && !empty($value) && $today >= $end)
            {
                $div = new TElement('span');
                $div->class="label label-warning";
                $div->style="text-shadow:none; font-size:12px";
                $div->add($data);
                return $div;
            }
            
            return $data;
        });
        
        $column_valor->setTransformer( function($value) {
            if (is_numeric($value)) {
                return 'R$&nbsp;'.number_format($value, 2, ',', '.');
            }
            return $value;
        });
        
        $action1 = new TDataGridAction(['ReceberForm', 'onEdit'], ['id'=>'{id}', 'register_state' => 'false']);
        $action2 = new TDataGridAction([$this, 'onCancel'], ['id'=>'{id}']);
        //$action3 = new TDataGridAction(['ReceberForm', 'onEdit'], ['id'=>'{id}', 'register_state' => 'false']);
        
        $action1->setDisplayCondition( function ($object) {
            return $object->ativo !== 'N';
        });
        
        $action2->setDisplayCondition( function ($object) {
            return $object->ativo !== 'N';
        });
        
        //$action3->setDisplayCondition( function ($object) {
        //    return $object->ativo !== 'N';
        //});
        
        $this->datagrid->addAction($action1, 'Editar Conta',            'far:edit blue');
        //$this->datagrid->addAction($action3, 'Editar Conta Dividida',   'fa:money-bill-wave-alt green');
        $this->datagrid->addAction($action2, _t('Cancel'), 'fa:ban red');
        
        // create the datagrid model
        $this->datagrid->createModel();
        
        // creates the page navigation
        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->setAction(new TAction([$this, 'onReload']));
        
        $panel = new TPanelGroup('<small>recebimentos</small>', 'white');
        $panel->add($this->datagrid);
        $panel->addFooter($this->pageNavigation);
        
        // header actions
        $dropdown = new TDropDown(_t('Export'), 'fa:list');
        $dropdown->setPullSide('right');
        $dropdown->setButtonClass('btn btn-default waves-effect dropdown-toggle');
        $dropdown->addAction( _t('Save as CSV'), new TAction([$this, 'onExportCSV'], ['register_state' => 'false', 'static'=>'1']), 'fa:table blue' );
        $dropdown->addAction( _t('Save as PDF'), new TAction([$this, 'onExportPDF'], ['register_state' => 'false', 'static'=>'1']), 'far:file-pdf red' );
        $panel->addHeaderWidget( $dropdown );
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        // $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $container->add($this->form);
        $container->add($panel);
        
        parent::add($container);
    }
    
    /**
     *
     */
    public function onCancel($param)
    {
        try
        {
            TTransaction::open(TSession::getValue('unit_database'));
            $contareceber = new ContaReceber($param['id']);
            $items = FaturaContaReceber::where('conta_receber_id ', '=', $param['id'])->load();

            foreach($items as $item)
            {
                $fatura = new fatura($item->fatura_id);
            }
            
            if (!empty($contareceber->dt_pagamento))
            {
                throw new Exception('Conta a receber já quitada');
            }
            else
            {
                $fatura->financeiro_gerado = 'N';
                $contareceber->ativo = 'N';
                $contareceber->store();
                $fatura->store();
            }
            new TMessage('info', 'Conta cancelada');
            
            TTransaction::close();
            
            $this->onReload($param);
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }
    
    /**
     * method Delete()
     * Não é permitido exlucir registros importantes
     */
    public function Delete($param)
    {
        new TMessage('error', 'Operação não permitida');
    }

    /**
     * method onGenerateRecibo()
     * Executado a partir da chamada de um botão
     */
    function onGenerateRecibo()
    {
        try
        {

            TTransaction::open(TSession::getValue('unit_database'));
            $contareceber = new ContaReceber($param['id']);

            $data = $this->form->getData();
            $this->form->validate();
            
            $designer = new TPDFDesigner;
            $designer->fromXml('app/reports/forms.pdf.xml');
            $designer->replace('{name}', $data->name );
            $designer->generate();
            
            $designer->gotoAnchorXY('anchor1');
            $designer->SetFontColorRGB('#FF0000');
            $designer->SetFont('Arial', 'B', 18);
            //$designer->Write(20, 'Dynamic text !');
            
            $file = 'app/output/pdf_shapes.pdf';            
            if (!file_exists($file) OR is_writable($file))
            {
                $designer->save($file);
                // parent::openFile($file);
                
                $window = TWindow::create(_t('Studio Pro - designed shapes'), 0.8, 0.8);
                $object = new TElement('object');
                $object->data  = $file;
                $object->type  = 'application/pdf';
                $object->style = "width: 100%; height:calc(100% - 10px)";
                $window->add($object);
                $window->show();
            }
            else
            {
                throw new Exception(_t('Permission denied') . ': ' . $file);
            }
            
            TTransaction::close();
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage());
        }
    }
}
