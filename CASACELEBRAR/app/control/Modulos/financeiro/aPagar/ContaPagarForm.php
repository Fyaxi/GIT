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
class ContaPagarForm extends TPage
{
    protected $form; // form
    
    use Adianti\Base\AdiantiStandardFormTrait; // Standard form methods
    
    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        
        parent::setTargetContainer('adianti_right_panel');
        
        $this->setDatabase(TSession::getValue('unit_database'));              // defines the database
        $this->setActiveRecord('ContaPagar');     // defines the active record
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_ContaPagar');
        $this->form->setFormTitle('Conta a Pagar');
        $this->form->setClientValidation(true);
        $this->form->setColumnClasses( 2, ['col-sm-5 col-lg-4', 'col-sm-7 col-lg-8'] );
        $this->form->enableCSRFProtection(); // ATIVA PROTEÇÃO CONTA EXECUÇÃO DE JAVA SCRIPT MALICIOSO

        // create the form fields
        $id = new TEntry('id');
        $dt_emissao = new TDate('dt_emissao');
        $dt_vencimento = new TDate('dt_vencimento');
        $dt_pagamento = new TDate('dt_pagamento');
        $pessoa_id = new TDBUniqueSearch('pessoa_id', TSession::getValue('unit_database'), 'Favorecido', 'id', 'nome_fantasia');
        $forma_recebimento = new TDBUniqueSearch('forma_recebimento', TSession::getValue('unit_database'), 'FormaPagamento', 'id', 'nome');
        $valor = new TNumeric('valor', 2, ',', '.', true);
        $desconto = new TNumeric('desconto', 72, ',', '.', true);
        $valor_total = new TNumeric('valor_total', 2, ',', '.', true);
        $obs = new TText('obs');


        // add the fields
        $this->form->addFields( [ new TLabel('Pagamento N°') ], [ $id ] );
        $this->form->addFields( [ new TLabel('Pessoa') ], [ $pessoa_id ] );
        $this->form->addFields( [ new TLabel('Data Emissao') ], [ $dt_emissao ] );
        $this->form->addFields( [ new TLabel('Data Vencimento') ], [ $dt_vencimento ] );
        $this->form->addFields( [ new TLabel('Data Pagamento') ], [ $dt_pagamento ] );
        $this->form->addFields( [ new TLabel('Forma Pagamento') ], [ $forma_recebimento ] );
        $this->form->addFields( [ new TLabel('Valor Total') ], [ $valor_total ], [ new TLabel('Desconto') ],[ $desconto ], [ new TLabel('Valor a Pagar') ], [ $valor ] );
        $this->form->addFields( [ new TLabel('Obs') ], [ $obs ] );

        $dt_emissao->addValidation('Data Emissao', new TRequiredValidator);
        $dt_vencimento->addValidation('Data Vencimento', new TRequiredValidator);
        $pessoa_id->addValidation('Pessoa Id', new TRequiredValidator);
        $forma_recebimento->addValidation('Forma Pagamento', new TRequiredValidator);


        // set sizes
        $id->setSize('100%');
        $dt_emissao->setSize('100%');
        $dt_vencimento->setSize('100%');
        $dt_pagamento->setSize('100%');
        $pessoa_id->setSize('100%');
        $forma_recebimento->setSize('100%');
        $valor->setSize('100%');
        $desconto->setSize('100%');
        $valor_total->setSize('100%');
        $obs->setSize('100%');

        $dt_emissao->setMask('dd/mm/yyyy');
        $dt_vencimento->setMask('dd/mm/yyyy');
        $dt_pagamento->setMask('dd/mm/yyyy');
        
        $dt_emissao->setDatabaseMask('yyyy-mm-dd');
        $dt_vencimento->setDatabaseMask('yyyy-mm-dd');
        $dt_pagamento->setDatabaseMask('yyyy-mm-dd');

        $forma_recebimento->setMinLength(0);
        $pessoa_id->setMinLength(0);
        
        $dt_emissao->setValue(date('Y-m-d'));
        $id->setEditable(FALSE);
        $valor->setEditable(FALSE);
        
        // create the form actions
        $btn = $this->form->addAction(_t('Save'), new TAction([$this, 'onSave']), 'fa:save');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addActionLink(_t('New'),  new TAction([$this, 'onEdit']), 'fa:eraser red');
        $this->form->addHeaderActionLink( _t('Close'), new TAction([$this, 'onClose']), 'fa:times red');
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        // $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
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
            if (isset($param['key']))
            {
                TTransaction::open(TSession::getValue('unit_database'));

                $key = $param['key'];
                
                $object = new ContaPagar($key);

                $this->form->setData($object);

                if( $object->forma_recebimento == 1 )
                {
                    $pos_action = new TAction(['ContaPagarList', 'onReload'], ['register_state' => 'true']);
                    new TMessage('error', '<span style="color:black;font-weight: bold;">UTILIZE A TELA DE PAGAMENTO DIVIDIDO<br>PARA MOFICIAR ESSE LANÇAMENTO</span>', $pos_action);
                }

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
     * Save form data
     * @param $param Request
     */
    public function onSave( $param )
    {
        try
        {
            TTransaction::open(TSession::getValue('unit_database')); // open a transaction
            
            $this->form->validate(); // validate form data
            $data = $this->form->getData(); // get form data as array
            
            $object = new ContaPagar;  // create an empty object
            $object->fromArray( (array) $data); // load the object with data
            $object->mes = TDateTime::convertToMask($object->dt_vencimento, 'yyyy-mm-dd', 'mm');
            $object->ano = TDateTime::convertToMask($object->dt_vencimento, 'yyyy-mm-dd', 'yyyy');
            
            if (empty($object->id))
            {
                $object->ativo = 'Y';
                $object->origem = 'A';
            }

            if( !empty($object->desconto) )
            {
                $object->valor = $object->valor_total - $object->desconto;
            }else
            {
                $object->valor = $object->valor_total;
            }

            if( $object->forma_recebimento == 1 )
            {
                $pos_action = new TAction(['PagarForm', 'onReload'], ['register_state' => 'true'], ['key' => $object->id]);
                new TMessage('error', '<span style="color:black;font-weight: bold;">UTILIZE A TELA DE LANÇAMENTOS DIVIDOS<br>PARA MOFICIAR/INSERIR ESSE RECEBIMENTO</span>', $pos_action);
            }
            else
            {
                ContaPagarPg::where('recebimento_id', '=', $object->id)->delete();
                $object->store(); // save the object

                // get the generated id
                $data->id = $object->id;
                $this->form->setData($data); // fill form data

                $pos_action = new TAction(['ContaPagarList', 'onReload'], ['register_state' => 'true']);
                new TMessage('info', 'Pagamento Salvo!', $pos_action);
            }

            TTransaction::close(); // close the transaction
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage()); // shows the exception error message
            $this->form->setData( $this->form->getData() ); // keep form data
            TTransaction::rollback(); // undo all pending operations
        }
    }
    /**
     * Close side panel
     */
    public static function onClose($param)
    {
        TScript::create("Template.closeRightPanel()");
    }
}
