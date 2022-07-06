<?php
/**
 * ReciboEvento TSession::getValue('unit_database')
 *
 * @version    2.0
 * @package    Sistema Integrado
 * @subpackage Módulos
 * @author     Jairo Barreto
 * @copyright  Copyright (c) 2021 Nativus Tecnologia. (http://www.nativustecnologia.com.br)
 * 
 */
class ReciboEvento extends TPage
{
    private $form; // form
    
    /**
     * Class constructor
     */
    function __construct()
    {
        parent::__construct();
        
        // creates the form
        $this->form = new BootstrapFormBuilder;
        $this->form->setFormTitle('Recibo');
        
        // create the form fields
        $name = new TEntry('name');
        
        $this->form->addFields( [new TLabel('Evento', 'red')], [$name] );
        $this->form->addAction('Gerar Recibo', new TAction(array($this, 'onGenerate')), 'far:check-circle green');
        $this->form->addActionLink('Novo Faturamento <b>(admin)</b>', new TAction(['FaturaForm', 'onEdit']), 'fa:plus green');
        
        $name->addValidation('Evento', new TRequiredValidator);
        
        // wrap the page content using vertical box
        $vbox = new TVBox;
        $vbox->style = 'width: 100%';
        $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $vbox->add($this->form);

        parent::add($vbox);
    }

    /**
     * method onGenerate()
     * Executed whenever the user clicks at the generate button
     */
    function onGenerate()
    {
        try
        {
            $data = $this->form->getData();
            $this->form->validate();
            
            $designer = new TPDFDesigner;
            $designer->fromXml('app/reports/ReportRecebimento.pdf.xml');
            $designer->replace('{name}', $data->name );
            $designer->replace('{LogoEmpresa}', $data->name );
            $designer->generate();

            //echo valor_por_extenso("12300500");

            $designer->gotoAnchorXY('anchor1');
            $designer->SetFontColorRGB('#FF0000');
            $designer->SetFont('Arial', 'B', 18);
            //$designer->Write(20, 'Dynamic text !');
            
            $file = 'app/output/pdf_shapes.pdf';            
            if (!file_exists($file) OR is_writable($file))
            {
                $designer->save($file);
                // parent::openFile($file);
                
                $window = TWindow::create('RECIBO DE PAGAMENTO', 0.8, 0.8);
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
        }
        catch (Exception $e) // in case of exception
        {
            new TMessage('error', $e->getMessage());
        }
    }
}
