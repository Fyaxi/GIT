<?php
/**
 * Parametros Active Record
 * @author  <your-name-here>
 */
class Parametros extends TRecord
{
    const TABLENAME = 'parametros';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('nome');
        parent::addAttribute('valor');
    }


}
