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
class ContaPagarList extends TPage
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
        $this->setActiveRecord('ContaPagar');   // defines the active record
        $this->setDefaultOrder('id', 'desc');         // defines the default order
        $this->setLimit(15);
        // $this->setCriteria($criteria) // define a standard filter

        $this->addFilterField('id', '=', 'id'); // filterField, operator, formField
        $this->addFilterField('pessoa_id', '=', 'pessoa_id'); // filterField, operator, formField
        $this->addFilterField('mes', '=', 'mes'); // filterField, operator, formField
        $this->addFilterField('ano', '=', 'ano'); // filterField, operator, formField
        
        $this->addFilterField('ativo', 'like', 'ativo'); // filterField, operator, formField
        $this->addFilterField('dt_emissao', '=', 'dt_emissao'); // filterField, operator, formField
        $this->addFilterField('dt_vencimento', '=', 'dt_vencimento'); // filterField, operator, formField
        $this->addFilterField('dt_pagamento', '=', 'dt_pagamento'); // filterField, operator, formField 
        
        $this->setOrderCommand('favorecido->nome_fantasia', '(SELECT nome_fantasia FROM favorecido WHERE favorecido.id=conta_pagar.pessoa_id)');
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_search_ContaPagar');
        $this->form->setFormTitle('Contas a Pagar');
        $this->form->enableCSRFProtection(); // ATIVA PROTEÇÃO CONTA EXECUÇÃO DE JAVA SCRIPT MALICIOSO
        

        // create the form fields
        $id = new TEntry('id');
        $pessoa_id = new TDBUniqueSearch('pessoa_id', TSession::getValue('unit_database'), 'Favorecido', 'id', 'nome_fantasia');
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
        $this->form->addFields( [ new TLabel('Favorecido') ], [ $pessoa_id ] );
        $this->form->addFields( [ new TLabel('Mes') ], [ $mes ] );
        $this->form->addFields( [ new TLabel('Ano') ], [ $ano ] );
        $this->form->addFields( [ new TLabel('Cancelados') ], [ $ativo ] );


        // set sizes
        $id->setSize('100%');
        $pessoa_id->setSize('100%');
        
        $dt_emissao->setSize('100%');
        $dt_vencimento->setSize('100%');
        $dt_pagamento->setSize('100%');

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
        $this->form->addActionLink('Novo Pagamento', new TAction(['PagarForm', 'onEdit'], ['register_state' => 'false']), 'fa:plus green');
        //$this->form->addActionLink('Pagamento Direto', new TAction(['ContaPagarForm', 'onEdit'], ['register_state' => 'false']), 'fa:plus green');
        
        // creates a Datagrid
        $this->datagrid = new BootstrapDatagridWrapper(new TDataGrid);
        $this->datagrid->style = 'width: 100%';
        // $this->datagrid->datatable = 'true';
        // $this->datagrid->enablePopover('Popover', 'Hi <b> {obs} </b>');
        

        // creates the datagrid columns
        $column_id = new TDataGridColumn('id', 'N°', 'center', '10%');
        $column_pessoa_id = new TDataGridColumn('favorecido->nome_fantasia', 'Favorecido', 'left');
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
        $column_pessoa_id->setAction(new TAction([$this, 'onReload']), ['order' => 'favorecido->nome_fantasia']);
        
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
            
            if ($value)
            {
                $value = TDate::convertToMask($value, 'yyyy-mm-dd', 'dd/mm/yyyy');
                $label = 'success';
            }
            else
            {
                $value = 'aguardando';
                $label = 'warning';
            }
            
            
            $div = new TElement('span');
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
        
        //$action1 = new TDataGridAction(['ContaPagarForm', 'onEdit'], ['id'=>'{id}', 'register_state' => 'false']);
        $action2 = new TDataGridAction([$this, 'onCancel'], ['id'=>'{id}']);
        $action3 = new TDataGridAction(['PagarForm', 'onEdit'], ['id'=>'{id}', 'register_state' => 'false']);
        
        //$action1->setDisplayCondition( function ($object) {
        //    return $object->ativo !== 'N';
        //});
        
        $action2->setDisplayCondition( function ($object) {
            return $object->ativo !== 'N';
        });

        $action3->setDisplayCondition( function ($object) {
            return $object->ativo !== 'N';
        });

        //$this->datagrid->addAction($action1, _t('Edit'),   'far:edit blue');
        $this->datagrid->addAction($action3, 'Editar Conta Dividida',   'fa:money-bill-wave-alt green');
        $this->datagrid->addAction($action2 ,_t('Cancel'), 'fa:ban red');
        
        // create the datagrid model
        $this->datagrid->createModel();
        
        // creates the page navigation
        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->setAction(new TAction([$this, 'onReload']));
        
        $panel = new TPanelGroup('<small>relação de pagamentos</small>', 'white');
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
            $contareceber = new ContaPagar($param['id']);
            
            if (!empty($contareceber->dt_pagamento))
            {
                throw new Exception('Conta a receber já quitada');
            }
            else
            {
                $contareceber->ativo = 'N';
                $contareceber->store();
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
     *
     */
    public function Delete($param)
    {
        new TMessage('error', 'Operação não permitida');
    }

}
