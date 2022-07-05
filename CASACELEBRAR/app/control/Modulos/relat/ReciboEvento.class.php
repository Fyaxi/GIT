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
        
        $name->addValidation('Evento', new TRequiredValidator);
        
        // wrap the page content using vertical box
        $vbox = new TVBox;
        $vbox->style = 'width: 100%';
        $vbox->add(new TXMLBreadCrumb('menu.xml', __CLASS__));
        $vbox->add($this->form);

        parent::add($vbox);
    }

    function valor_por_extenso( $v ){
		
        $v = filter_var($v, FILTER_SANITIZE_NUMBER_INT);
       
            $sin = array("centavo", "real", "mil", "milhão", "bilhão", "trilhão", "quatrilhão");
            $plu = array("centavos", "reais", "mil", "milhões", "bilhões", "trilhões","quatrilhões");
    
            $c = array("", "cem", "duzentos", "trezentos", "quatrocentos","quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos");
            $d = array("", "dez", "vinte", "trinta", "quarenta", "cinquenta","sessenta", "setenta", "oitenta", "noventa");
            $d10 = array("dez", "onze", "doze", "treze", "quatorze", "quinze","dezesseis", "dezesete", "dezoito", "dezenove");
            $u = array("", "um", "dois", "três", "quatro", "cinco", "seis","sete", "oito", "nove");
    
            $z = 0;
     
            $v = number_format( $v, 2, ".", "." );
            $int = explode( ".", $v );
     
            for ( $i = 0; $i < count( $int ); $i++ ) 
            {
                for ( $ii = mb_strlen( $int[$i] ); $ii < 3; $ii++ ) 
                {
                    $int[$i] = "0" . $int[$i];
                }
            }
    
            $rt = null;
            $fim = count( $int ) - ($int[count( $int ) - 1] > 0 ? 1 : 2);
            for ( $i = 0; $i < count( $int ); $i++ )
            {
                $v = $int[$i];
                $rc = (($v > 100) && ($v < 200)) ? "cento" : $c[$v[0]];
                $rd = ($v[1] < 2) ? "" : $d[$v[1]];
                $ru = ($v > 0) ? (($v[1] == 1) ? $d10[$v[2]] : $u[$v[2]]) : "";
     
                $r = $rc . (($rc && ($rd || $ru)) ? " e " : "") . $rd . (($rd && $ru) ? " e " : "") . $ru;
                $t = count( $int ) - 1 - $i;
                $r .= $r ? " " . ($v > 1 ? $plu[$t] : $sin[$t]) : "";
                if ( $v == "000")
                    $z++;
                elseif ( $z > 0 )
                    $z--;
                    
                if ( ($t == 1) && ($z > 0) && ($int[0] > 0) )
                    $r .= ( ($z > 1) ? " de " : "") . $plu[$t];
                    
                if ( $r )
                    $rt = $rt . ((($i > 0) && ($i <= $fim) && ($int[0] > 0) && ($z < 1)) ? ( ($i < $fim) ? ", " : " e ") : " ") . $r;
            }
     
            $rt = mb_substr( $rt, 1 );
     
            return($rt ? trim( $rt ) : "zero");
     
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

            echo valor_por_extenso("12300500");

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
