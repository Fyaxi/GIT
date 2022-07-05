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
class FaturaForm extends TWindow
{
    protected $form; // form
    protected $fieldlist;
    
    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct($param)
    {
        parent::__construct($param);
        parent::setSize(0.8, null);
        parent::removePadding();
        parent::removeTitleBar();
        //parent::disableEscape();
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_Fatura');
        $this->form->setFormTitle('Tela Faturamento');
        $this->form->setClientValidation(true);
        $this->form->enableCSRFProtection(); // ATIVA PROTEÇÃO CONTA EXECUÇÃO DE JAVA SCRIPT MALICIOSO
        
        // master fields
        $id                     = new TEntry('id');
        $cliente_id             = new TDBUniqueSearch('cliente_id', TSession::getValue('unit_database'), 'Pessoa', 'id', 'nome_fantasia');
        $VendedorLogin          = new TEntry('VendedorLogin');
        $dt_fatura              = new TDate('dt_fatura');
        //$DataPrevistoPagamento  = new TDate('DataPrevistoPagamento');
        $FormaRecebimento       = new TDBUniqueSearch('FormaRecebimento', TSession::getValue('unit_database'), 'FormaRecebimento', 'id', 'nome');
        $ValorEntrada           = new TNumeric('ValorEntrada', 2, ',', '.');
        $ValorDesconto          = new TNumeric('ValorDesconto', 2, ',', '.');
        $ValorContrato          = new TNumeric('ValorContrato', 2, ',', '.');
        $ValorTotal             = new TNumeric('ValorTotal', 2, ',', '.');
        $total                  = new TNumeric('total', 2, ',', '.');

        // sizes
        $id->setSize('100%');
        $cliente_id->setSize('100%');
        $VendedorLogin->setSize('100%');
        $dt_fatura->setSize('100%');
        //$DataPrevistoPagamento->setSize('100%');
        $FormaRecebimento->setSize('100%');
        $ValorEntrada->setSize('100%');
        $ValorDesconto->setSize('100%');
        $ValorContrato->setSize('100%');
        $ValorTotal->setSize('100%');
        $total->setSize('100%');

        $grupoUser = TSession::getValue('usergroupids');
        if( $grupoUser['0'] > 0 ) // Visualização Admin
        {
            $cliente_id->setEditable(FALSE);
            $dt_fatura->setEditable(FALSE);
            $VendedorLogin->setEditable(FALSE);
            $FormaRecebimento->setEditable(FALSE);
            $ValorEntrada->setEditable(FALSE);
            $ValorDesconto->setEditable(FALSE);
            $ValorContrato->setEditable(FALSE);
            $ValorTotal->setEditable(FALSE);
            $total->setEditable(FALSE);
        }
        
        $cliente_id->addValidation('Cliente', new TRequiredValidator);
        $dt_fatura->addValidation('Dt Fatura', new TRequiredValidator);
        //$DataPrevistoPagamento->addValidation('Dt Previsão Pagamento', new TRequiredValidator);

        $id->setEditable(FALSE);
        $VendedorLogin->setEditable(FALSE);
        $cliente_id->setMinLength(0);
        $FormaRecebimento->setMinLength(0);
        
        $dt_fatura->setMask('dd/mm/yyyy');
        $dt_fatura->setDatabaseMask('yyyy-mm-dd');

        //$DataPrevistoPagamento->setMask('dd/mm/yyyy');
        //$DataPrevistoPagamento->setDatabaseMask('yyyy-mm-dd');
        
        // add form fields to the form
        $this->form->addFields( [new TLabel('Id')], [$id] );
        $this->form->addFields( [new TLabel('Cliente')], [$cliente_id], [new TLabel('Vendedor Resp.')], [$VendedorLogin]  );
        $this->form->addFields( [new TLabel('Dt Fatura')], [$dt_fatura] );
        $this->form->addFields( [new TLabel('Tipo Entrada')], [$FormaRecebimento], [new TLabel('Valor Base')], [$ValorContrato], [new TLabel('Valor Desconto')], [$ValorDesconto] );
        $this->form->addFields( [new TLabel('Valor Entrada')], [$ValorEntrada], [new TLabel('Valor Total')], [$ValorTotal], [new TLabel('A Receber')], [$total]);
        
        
        // detail fields
        //$this->fieldlist = new TFieldList;
        //$this->fieldlist-> width = '100%';
        //$this->fieldlist->enableSorting();
        
        //$servico_id = new TDBUniqueSearch('list_servico_id[]', TSession::getValue('unit_database'), 'Servico', 'id', 'nome', null, TCriteria::create( ['ativo' => 'Y'] ));
        //$servico_id->setChangeAction(new TAction(array($this, 'onChangeServico')));

        //$valor = new TNumeric('list_valor[]', 2, ',', '.');
        //$valor->setEditable(FALSE);

        //$quantidade = new TNumeric('list_quantidade[]', 2, ',', '.');
        
        //$servico_id->setSize('100%');
        //$valor->setSize('100%');
        //$quantidade->setSize('100%');
        //$servico_id->setMinLength(0);

        //$this->fieldlist->addField( '<b>Servico</b>', $servico_id, ['width' => '40%']);
        //$this->fieldlist->addField( '<b>Valor</b>', $valor, ['width' => '30%']);
        //$this->fieldlist->addField( '<b>Quantidade</b>', $quantidade, ['width' => '30%']);

        //$this->form->addField($servico_id);
        //$this->form->addField($valor);
        //$this->form->addField($quantidade);
        
        //$detail_wrapper = new TElement('div');
        //$detail_wrapper->add($this->fieldlist);
        //$detail_wrapper->style = 'overflow-x:auto';
        
        //$this->form->addContent( [ TElement::tag('h5', 'Lançamentos', [ 'style'=>'background: whitesmoke; padding: 5px; border-radius: 5px; margin-top: 5px'] ) ] );
        //$this->form->addContent( [ $detail_wrapper ] );
        

        if( $grupoUser['0'] == 1 ) // Visualização Admin
        {
            $this->form->addAction( 'Salvar <b>(admin)</b>',  new TAction( [$this, 'onSave'] ),  'fa:save green' );
            $this->form->addAction( 'Limpar <b>(admin)</b>', new TAction( [$this, 'onClear'] ), 'fa:eraser red' );
        }

        $this->form->addHeaderActionLink( _t('Close'), new TAction([$this, 'onClose']), 'fa:window-close red');
        
        // create the page container
        $container = new TVBox;
        $container->style = 'width: 100%';
        //$container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $container->add($this->form);
        parent::add($container);
    }
    
    /**
     * Executed whenever the user clicks at the edit button da datagrid
     */
    function onEdit($param)
    {
        try
        {
            TTransaction::open(TSession::getValue('unit_database'));
            
            if (isset($param['key']))
            {
                $key = $param['key'];
                
                $object = new Fatura($key);
                $this->form->setData($object);
                
                //$items  = FaturaItem::where('fatura_id', '=', $key)->load();
                
                //if ($items)
                //{
                //    $this->fieldlist->addHeader();
                //    foreach($items  as $item )
                //    {
                //        $detail = new stdClass;
                //        $detail->list_servico_id = $item->servico_id;
                //        $detail->list_valor = $item->valor;
                //        $detail->list_quantidade = $item->quantidade;
                //        $this->fieldlist->addDetail($detail);
                //    }
                //
                //    $this->fieldlist->addCloneAction();
                //}
                //else
                //{
                    //$this->onClear($param);
                //}
                
                TTransaction::close(); // close transaction  
                
            }
            else
            {
                $this->onClear($param);
            }
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage());
            TTransaction::rollback();
        }
    }

    /**
     * Change servico
     */
    public static function onChangeServico($param)
    {
        $input_id = $param['_field_id'];
        $servico_id = $param['_field_value'];
        $input_pieces = explode('_', $input_id);
        $unique_id = end($input_pieces);
        
        if ($servico_id)
        {
            $response = new stdClass;
            
            try
            {
                TTransaction::open(TSession::getValue('unit_database'));
                
                $servico = Servico::find($servico_id);
                $response->{'list_quantidade_'.$unique_id} = '1,00';
                $response->{'list_valor_'.$unique_id} = number_format($servico->valor,2,',', '.');
                
                TForm::sendData('form_Fatura', $response);
                TTransaction::close();
            }
            catch (Exception $e)
            {
                TTransaction::rollback();
            }
        }
    }
    
    /**
     * Clear form
     */
    public function onClear($param)
    {
        //$this->fieldlist->addHeader();
        //$this->fieldlist->addDetail( new stdClass );
        //$this->fieldlist->addCloneAction();
    }
    
    /**
     * Save the Fatura and the FaturaItem's
     */
    public static function onSave($param)
    {
        try
        {
            TTransaction::open(TSession::getValue('unit_database'));
            
            $id = (int) $param['id'];
            $master = new Fatura;
            $master->fromArray( $param);

            $master->dt_fatura      = TDateTime::convertToMask($param['dt_fatura'], 'dd/mm/yyyy', 'yyyy-mm-dd');
            $master->mes            = TDateTime::convertToMask($param['dt_fatura'], 'dd/mm/yyyy', 'mm');
            $master->ano            = TDateTime::convertToMask($param['dt_fatura'], 'dd/mm/yyyy', 'yyyy');

            $master->ValorEntrada   = (float) str_replace(['.',','], ['','.'], $param['ValorEntrada']);
            $master->ValorDesconto  = (float) str_replace(['.',','], ['','.'], $param['ValorDesconto']);
            $master->ValorContrato  = (float) str_replace(['.',','], ['','.'], $param['ValorContrato']);
            $master->ValorTotal     = (float) str_replace(['.',','], ['','.'], $param['ValorTotal']);
            $master->total          = (float) str_replace(['.',','], ['','.'], $param['total']);

            if (empty($param['id']))
            {
                // variáveis do faturamento / contas a receber
                $master->FormaRecebimento   = $param['FormaRecebimento'];
                $master->ValorEntrada       = $param['ValorEntrada'];
                $master->ValorDesconto      = $param['ValorDesconto'];
                $master->ValorContrato      = $param['ValorContrato'];
                $master->ValorTotal         = $param['ValorTotal'];
                $master->total              = $param['total'];

                $master->IdVendedor         = TSession::getValue('userid');
                $master->VendedorLogin      = TSession::getValue('login');

                $master->ativo = 'Y';
                $master->financeiro_gerado = 'N';
            }
            
            $master->store(); // save master object
            //print_r($param);
            
            // delete details
            //FaturaItem::where('fatura_id', '=', $master->id)->delete();
            
            //if( !empty($param['list_servico_id']) AND is_array($param['list_servico_id']) )
            //{
            //    $total = 0;
            //    foreach( $param['list_servico_id'] as $row => $servico_id)
            //    {
            //        if (!empty($servico_id))
            //        {
            //            $detail = new FaturaItem;
            //            $detail->fatura_id = $master->id;
            //            $detail->servico_id = $param['list_servico_id'][$row];
            //            $detail->valor =      (float) str_replace(['.',','], ['','.'], $param['list_valor'][$row]);
            //            $detail->quantidade = (float) str_replace(['.',','], ['','.'], $param['list_quantidade'][$row]);
            //            $detail->total = round($detail->valor * $detail->quantidade, 2);
            //            $detail->store();
            //            
            //            $total += $detail->total;
            //        }
            //    }
            //
            //    $master->total = $total;
            //    $master->store(); // save master object
            //}
            
            $data = new stdClass;
            $data->id = $master->id;
            TForm::sendData('form_Fatura', $data);
            TTransaction::close(); // close the transaction
            
            $pos_action = new TAction(['FaturaList', 'onReload']);
            new TMessage('info', AdiantiCoreTranslator::translate('Record saved'), $pos_action);
            parent::closeWindow();
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage());
            TTransaction::rollback();
        }
    }
    
    /**
     * Close
     */
    public static function onClose($param)
    {
        TScript::create(' $("select[name=\'cliente_id\'").prop("disabled", false); ');
        parent::closeWindow();
    }   
}
