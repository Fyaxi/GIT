<?php
/**
 * StatusFormList Registration
 * @author  <your name here>
 */
class StatusFormList extends TStandardFormList
{
    protected $form; // form
    protected $datagrid; // datagrid
    protected $pageNavigation;
    
    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        
        // defines the database
        parent::setDatabase('changeman');
        
        // defines the active record
        parent::setActiveRecord('Status');
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_Status');
        $this->form->setFormTitle(_t('Status'));
        
        $options = array('Y'=>_t('Yes'), 'N'=>_t('No'));
        
        // create the form fields
        $id           = new TEntry('id');
        $description  = new TEntry('description');
        $final_state  = new TRadioGroup('final_state');
        $color        = new TColor('color');
        
        $id->setEditable(FALSE);
        $final_state->addItems($options);
        $final_state->setLayout('horizontal');
        $description->addValidation( _t('Description'), new TRequiredValidator );
        
        // define the sizes
        $this->form->addFields( [new TLabel('ID')], [$id] );
        $this->form->addFields( [$ld=new TLabel(_t('Description'))], [$description] );
        $this->form->addFields( [new TLabel(_t('Final state'))], [$final_state],
                                [new TLabel(_t('Color'))],       [$color] );
        
        $id->setSize('25%');
        $description->setSize('100%');
        $final_state->setSize('100%');
        $color->setSize('100%');
        $ld->setFontColor('red');
        $final_state->setUseButton();
        
        // define the form action
        $btn = $this->form->addAction(_t('Save'), new TAction(array($this, 'onSave')), 'far:save');
        $btn->class = 'btn btn-sm btn-primary';
        $this->form->addAction(_t('New'), new TAction(array($this, 'onEdit')), 'fa:eraser red');
        
        // creates a DataGrid
        $this->datagrid = new BootstrapDatagridWrapper(new TQuickGrid);
        $this->datagrid->width = '100%';
        $this->datagrid->setHeight(320);
        
        // creates the datagrid columns
        $this->datagrid->addQuickColumn('ID', 'id', 'center', 50, new TAction(array($this, 'onReload')), array('order', 'id'));
        $this->datagrid->addQuickColumn(_t('Description'), 'description', 'left', NULL, new TAction(array($this, 'onReload')), array('order', 'description'));
        $this->datagrid->addQuickColumn(_t('Final state'), 'final_state', 'left', NULL, new TAction(array($this, 'onReload')), array('order', 'final_state'));
        $this->datagrid->addQuickColumn(_t('Color'), 'color', 'left', NULL);

        
        // add the actions to the datagrid
        $this->datagrid->addQuickAction(_t('Edit'), new TDataGridAction(array($this, 'onEdit')), 'id', 'far:edit blue');
        $this->datagrid->addQuickAction(_t('Delete'), new TDataGridAction(array($this, 'onDelete')), 'id', 'far:trash-alt red');
        
        // create the datagrid model
        $this->datagrid->createModel();
        
        // creates the page navigation
        $this->pageNavigation = new TPageNavigation;
        $this->pageNavigation->setAction(new TAction(array($this, 'onReload')));
        $this->pageNavigation->setWidth($this->datagrid->getWidth());
        
        $panel = new TPanelGroup;
        $panel->add($this->datagrid);
        $panel->addFooter($this->pageNavigation);
        
        // creates the page structure using a vbox
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $container->add($this->form);
        $container->add($panel);
        
        // add the container inside the page
        parent::add($container);
    }
}
