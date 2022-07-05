<?php
/**
 * Produto Active Record
 * @author  <your-name-here>
 */
class Produto extends TRecord
{
    const TABLENAME = 'produto';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // {max, serial}

    const CACHECONTROL = 'TAPCache';
    
    const CREATEDAT = 'created_at';
    const UPDATEDAT = 'updated_at';
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('nome');
        parent::addAttribute('valor');
        parent::addAttribute('custo');
        parent::addAttribute('estoque');
        parent::addAttribute('tipo_servico_id');
        parent::addAttribute('ativo');
    }

    public function get_tipo_servico()
    {
        return TipoProduto::find($this->tipo_servico_id);
    }

}
