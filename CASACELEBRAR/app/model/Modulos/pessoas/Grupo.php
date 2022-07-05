<?php
/**
 * Grupo Active Record
 * @author  <your-name-here>
 */
class Grupo extends TRecord
{
    const TABLENAME = 'grupo';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('nome');
    }


}
