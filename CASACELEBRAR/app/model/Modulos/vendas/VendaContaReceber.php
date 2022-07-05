<?php
/**
 * VendaContaReceber Active Record
 * @author  <your-name-here>
 */
class VendaContaReceber extends TRecord
{
    const TABLENAME = 'venda_conta_receber';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('fatura_id');
        parent::addAttribute('conta_receber_id');
    }


}
