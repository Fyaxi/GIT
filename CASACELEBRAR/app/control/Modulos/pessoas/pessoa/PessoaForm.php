<?php
/**
 * PessoaForm
 *
 * @version    1.0
 * @package    erphouse
 * @subpackage control
 * @author     Pablo Dall'Oglio
 * @copyright  Copyright (c) 2006 Adianti Solutions Ltd. (http://www.adianti.com.br)
 * @license    http://www.adianti.com.br/framework-license
 */
class PessoaForm extends TWindow
{
    protected $form; // form
    
    /**
     * Form constructor
     * @param $param Request
     */
    public function __construct( $param )
    {
        parent::__construct();
        parent::setSize(0.8, null);
        parent::removePadding();
        parent::removeTitleBar();
        //parent::disableEscape();
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_Pessoa');
        $this->form->setFormTitle('Clientes');
        $this->form->setProperty('style', 'margin:0;border:0');
        $this->form->setClientValidation(true);

        // Remoção da funcionalidade devido ao novo modal da página.
        //$this->form->enableCSRFProtection(); // ATIVA PROTEÇÃO CONTA EXECUÇÃO DE JAVA SCRIPT MALICIOSO

        $this->form->appendPage('Dados Cadastrais');

        // create the form fields
        $id = new TEntry('id');
        //$nome = new TEntry('nome');
        $nome_fantasia = new TEntry('nome_fantasia');
        //$tipo = new TCombo('tipo');
        $codigo_nacional = new TEntry('codigo_nacional');
        $codigo_estadual = new TEntry('codigo_estadual');
        $codigo_municipal = new TEntry('codigo_municipal');
        $fone = new TEntry('fone');
        $email = new TEntry('email');
        $observacao = new TText('observacao');
        $cep = new TEntry('cep');
        $logradouro = new TEntry('logradouro');
        $numero = new TEntry('numero');
        $complemento = new TEntry('complemento');
        $bairro = new TEntry('bairro');

        $aniversario = new TDate('aniversario');
        
        $filter = new TCriteria;
        $filter->add(new TFilter('id', '<', '0'));
        $cidade_id = new TDBCombo('cidade_id', TSession::getValue('unit_database'), 'Cidade', 'id', 'nome', 'nome', $filter);
        $grupo_id = new TDBRadioGroup('grupo_id', TSession::getValue('unit_database'), 'Grupo', 'id', 'nome');
        $papeis_id = new TDBMultiSearch('papeis_id', TSession::getValue('unit_database'), 'Papel', 'id', 'nome');
        $estado_id = new TDBCombo('estado_id', TSession::getValue('unit_database'), 'Estado', 'id', '{nome} ({uf})');
        
        $estado_id->setChangeAction( new TAction( [$this, 'onChangeEstado'] ) );
        $cep->setExitAction( new TAction([ $this, 'onExitCEP']) );
        $codigo_nacional->setExitAction( new TAction( [$this, 'onExitCNPJ'] ) );

        $grupo_id->setLayout('vertical TDBCheckGroup');
        
        $cidade_id->enableSearch();
        $estado_id->enableSearch();
        //$grupo_id->setMinLength(0);
        $papeis_id->setMinLength(0);
        $papeis_id->setSize('100%', 60);
        $observacao->setSize('100%', 60);
        //$tipo->addItems( ['F' => 'Física'] );

        $row = $this->form->addFields( [ new TLabel('<br>ID'),     $id ],
                                       [ new TLabel('<br>Nome <span style="color:red">*</span>'),     $nome_fantasia ],
                                       [ new TLabel('<br>Fone <span style="color:red">*</span>'),   $fone ]);
        $row->layout = ['col-sm-2', 'col-sm-7', 'col-sm-3' ];

        $row = $this->form->addFields( [ new TLabel('<br>RG'),  $codigo_municipal ],
                                       [ new TLabel('<br>CPF'),     $codigo_nacional ],
                                       [ new TLabel('<br>Aniversário'),   $aniversario ],
                                       [ new TLabel('<br>Email'),   $email ]);
        $row->layout = ['col-sm-2', 'col-sm-3', 'col-sm-3', 'col-sm-4'];

        $label2 = new TLabel('<br>Observação', '', 12, '');
        $label2->style='text-align:left;border-bottom:1px solid #c0c0c0;width:100%';
        $this->form->addContent( [$label2] );
        
        $row = $this->form->addFields( [ $observacao ] );
        $row->layout = ['col-sm-12' ];
        
        $subform = new BootstrapFormBuilder;
        $subform->setFieldSizes('100%');
        $subform->setProperty('style', 'border:none');
        
        $subform->appendPage( 'Endereço <span style="color:red">*</span>' );
        $row = $subform->addFields( [ new TLabel('<br>Cep'),      $cep ],
                                       [ new TLabel('<br>Logradouro'),       $logradouro ],
                                       [ new TLabel('<br>Numero'), $numero ] );
        $row->layout = ['col-sm-2', 'col-sm-8', 'col-sm-2'];
        
        $row = $subform->addFields( [ new TLabel('<br>Complemento'),  $complemento ],
                                       [ new TLabel('<br>Bairro'),  $bairro ] );
        $row->layout = ['col-sm-6', 'col-sm-6'];

        $row = $subform->addFields( [ new TLabel('<br>Estado'),  $estado_id ],
                                       [ new TLabel('<br>Cidade'),  $cidade_id ] );
        $row->layout = ['col-sm-6', 'col-sm-6'];
        
        $subform->appendPage( 'Vínculos <span style="color:red">*</span>' );
        $row = $subform->addFields( [ new TLabel('<br>Papéis <span style="color:red">*</span>'),  $papeis_id ],
                                       [ new TLabel('<br>Grupos <span style="color:red">*</span>'),  $grupo_id ] );
        $row->layout = ['col-sm-6', 'col-sm-6'];
        
        $this->form->addContent( [$subform] );
        
        // add the fields
        //$this->form->addFields( [ new TLabel('Id') ], [ $id ] );
        //$this->form->addFields( [ new TLabel('Tipo') ], [ $tipo ], [ new TLabel('CPF/CNPJ') ], [ $codigo_nacional ] );
        //$this->form->addFields( [ new TLabel('Nome') ], [ $nome ] );
        //$this->form->addFields( [ new TLabel('Nome Fantasia') ], [ $nome_fantasia ] );
        //$this->form->addFields( [ new TLabel('Papéis')], [ $papeis_id ], [ new TLabel('Grupo') ], [ $grupo_id ] );
        //$this->form->addFields( [ new TLabel('I.E.') ], [ $codigo_estadual ], [ new TLabel('I.M.') ], [ $codigo_municipal ] );
        //$this->form->addFields( [ new TLabel('Fone') ], [ $fone ], [ new TLabel('Email') ], [ $email ] );
        //$this->form->addFields( [ new TLabel('Observacao') ], [ $observacao ] );
        
        //$this->form->addContent( [new TFormSeparator('Endereço')]);
        //$this->form->addFields( [ new TLabel('Cep') ], [ $cep ] )->layout = ['col-sm-2 control-label', 'col-sm-4'];
        //$this->form->addFields( [ new TLabel('Logradouro') ], [ $logradouro ], [ new TLabel('Numero') ], [ $numero ] );
        //$this->form->addFields( [ new TLabel('Complemento') ], [ $complemento ], [ new TLabel('Bairro') ], [ $bairro ] );
        //$this->form->addFields( [ new TLabel('Estado') ], [$estado_id], [ new TLabel('Cidade') ], [ $cidade_id ] );

        // set sizes
        $id->setSize('100%');
        //$nome->setSize('100%');
        $nome_fantasia->setSize('100%');
        //$tipo->setSize('100%');
        $codigo_nacional->setSize('100%');  // CPF
        $codigo_estadual->setSize('100%');  // 
        $codigo_municipal->setSize('100%'); // RG
        $fone->setSize('100%');
        $email->setSize('100%');
        $observacao->setSize('100%');
        $cep->setSize('100%');
        $logradouro->setSize('100%');
        $numero->setSize('100%');
        $complemento->setSize('100%');
        $bairro->setSize('100%');
        $cidade_id->setSize('100%');
        $grupo_id->setSize('100%');

        $aniversario->setSize('100%');
        $aniversario->setMask('dd/mm/yyyy');
        $aniversario->setDatabaseMask('yyyy-mm-dd');

        $cep->setMask('99.999-999');
        $fone->setMask('(99) 999999999');
        $numero->setMask('999999');

        //$nome->forceUpperCase();
        $nome_fantasia->forceUpperCase();
        $logradouro->forceUpperCase();
        $bairro->forceUpperCase();
        $complemento->forceUpperCase();

        $id->setEditable(FALSE);

        $nome_fantasia->addValidation('Nome Fantasia', new TRequiredValidator);
        $grupo_id->addValidation('Grupo', new TRequiredValidator);
        $fone->addValidation('Fone', new TRequiredValidator); 
        $papeis_id->addValidation('Papel', new TRequiredValidator); 
        $cidade_id->addValidation('Cidade', new TRequiredValidator);
        $cep->addValidation('CEP', new TRequiredValidator);
        $logradouro->addValidation('Logradouro', new TRequiredValidator);
        $numero->addValidation('Número', new TRequiredValidator);
        
        // create the form actions
        $this->form->addHeaderActionLink( _t('Close'),  new TAction([__CLASS__, 'onClose'], ['static'=>'1']), 'fa:times red');
        $btn = $this->form->addAction(_t('Save'), new TAction([$this, 'onSave']), 'fa:save');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addActionLink(_t('New'),  new TAction([$this, 'onEdit']), 'fa:eraser red');
        
        // vertical box container
        $container = new TVBox;
        $container->style = 'width: 100%';
        // $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $container->add($this->form);
        
        parent::add($container);
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
            
            $object = new Pessoa;  // create an empty object
            $object->fromArray( (array) $data); // load the object with data
            $object->store(); // save the object
            
            PessoaPapel::where('pessoa_id', '=', $object->id)->delete();
            
            if ($data->papeis_id)
            {
                foreach ($data->papeis_id as $papel_id)
                {
                    $pp = new PessoaPapel;
                    $pp->pessoa_id = $object->id;
                    $pp->papel_id  = $papel_id;
                    $pp->store();
                }
            }
            
            // get the generated id
            $data->id = $object->id;
            
            $this->form->setData($data); // fill form data
            TTransaction::close(); // close the transaction
            
            $pos_action = new TAction(['PessoaList', 'onReload']);
            new TMessage('info', AdiantiCoreTranslator::translate('Record saved'), $pos_action);
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage()); // shows the exception error message
            $this->form->setData( $this->form->getData() ); // keep form data
            TTransaction::rollback(); // undo all pending operations
        }
    }
    
    /**
     * Clear form data
     * @param $param Request
     */
    public function onClear( $param )
    {
        $this->form->clear(TRUE);
    }
    
    /**
     * Load object to form data
     * @param $param Request
     */
    public function onEdit( $param )
    {
        try
        {
            if (isset($param['key']))
            {
                $key = $param['key'];
                TTransaction::open(TSession::getValue('unit_database'));
                $object = new Pessoa($key);
                
                $object->papeis_id = PessoaPapel::where('pessoa_id', '=', $object->id)->getIndexedArray('papel_id');
                
                $this->form->setData($object);
                
                // force fire events
                $data = new stdClass;
                $data->estado_id = $object->cidade->estado->id;
                $data->cidade_id = $object->cidade_id;
                TForm::sendData('form_Pessoa', $data);
                
                TTransaction::close();
            }
            else
            {
                $this->form->clear(TRUE);
            }
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage()); // shows the exception error message
            TTransaction::rollback(); // undo all pending operations
        }
    }
    
    /**
     * Action to be executed when the user changes the state
     * @param $param Action parameters
     */
    public static function onChangeEstado($param)
    {
        try
        {
            TTransaction::open(TSession::getValue('unit_database'));
            if (!empty($param['estado_id']))
            {
                $criteria = TCriteria::create( ['estado_id' => $param['estado_id'] ] );
                
                // formname, field, database, model, key, value, ordercolumn = NULL, criteria = NULL, startEmpty = FALSE
                TDBCombo::reloadFromModel('form_Pessoa', 'cidade_id', TSession::getValue('unit_database'), 'Cidade', 'id', '{nome} ({id})', 'nome', $criteria, TRUE);
            }
            else
            {
                TCombo::clearField('form_Pessoa', 'cidade_id');
            }
            
            TTransaction::close();
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }
    
    /**
     * Autocompleta outros campos a partir do CNPJ
     */
    public static function onExitCNPJ($param)
    {
        session_write_close();
        
        try
        {
            $cnpj = preg_replace('/[^0-9]/', '', $param['codigo_nacional']);
            $url  = 'http://receitaws.com.br/v1/cnpj/'.$cnpj;
            
            $content = @file_get_contents($url);
            
            if ($content !== false)
            {
                $cnpj_data = json_decode($content);
                
                //TToast::show('error', $cnpj_data->cep, 'top center', 'fas:window-close' );
                
                $data = new stdClass;
                if (is_object($cnpj_data) && $cnpj_data->status !== 'ERROR')
                {
                    $data->tipo = 'J';
                    $data->nome = $cnpj_data->nome;
                    $data->nome_fantasia = !empty($cnpj_data->fantasia) ? $cnpj_data->fantasia : $cnpj_data->nome;
                    
                    if (empty($param['cep']))
                    {
                        $data->cep = $cnpj_data->cep;
                        $data->numero = $cnpj_data->numero;
                    }
                    
                    if (empty($param['fone']))
                    {
                        $data->fone = $cnpj_data->telefone;
                    }
                    
                    if (empty($param['email']))
                    {
                        $data->email = $cnpj_data->email;
                    }
                    
                    TForm::sendData('form_Pessoa', $data, false, true);
                }
                else
                {
                    $data->nome = '';
                    $data->nome_fantasia = '';
                    $data->cep = '';
                    $data->numero = '';
                    $data->telefone = '';
                    $data->email = '';
                    TForm::sendData('form_Pessoa', $data, false, true);
                }
            }
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }
    
    /**
     * Autocompleta outros campos a partir do CEP
     */
    public static function onExitCEP($param)
    {
        session_write_close();
        
        try
        {
            $cep = preg_replace('/[^0-9]/', '', $param['cep']);
            //$url = 'https://viacep.com.br/ws/unicode/'.$cep.'/json/';
            $url = 'https://viacep.com.br/ws/'.$cep.'/json/';
            
            $content = @file_get_contents($url);
            
            if ($content !== false)
            {
                $cep_data = json_decode($content);
                
                $data = new stdClass;
                if (is_object($cep_data) && empty($cep_data->erro))
                {
                    TTransaction::open(TSession::getValue('unit_database'));
                    $estado = Estado::where('uf', '=', $cep_data->uf)->first();
                    $cidade = Cidade::where('codigo_ibge', '=', $cep_data->ibge)->first();
                    TTransaction::close();
                    
                    $data->logradouro  = $cep_data->logradouro;
                    $data->complemento = $cep_data->complemento;
                    $data->bairro      = $cep_data->bairro;
                    $data->estado_id   = $estado->id ?? '';
                    $data->cidade_id   = $cidade->id ?? '';
                    
                    TForm::sendData('form_Pessoa', $data, false, true);
                }
                else
                {
                    $data->logradouro  = '';
                    $data->complemento = '';
                    $data->bairro      = '';
                    $data->estado_id   = '';
                    $data->cidade_id   = '';
                    
                    TForm::sendData('form_Pessoa', $data, false, true);
                }
            }
        }
        catch (Exception $e)
        {
            new TMessage('error', $e->getMessage());
        }
    }
    
    /**
     * Closes window
     */
    public static function onClose()
    {
        parent::closeWindow();
    }
}
