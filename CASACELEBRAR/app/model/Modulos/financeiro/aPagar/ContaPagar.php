'<?php
/**
 * ContaPagar Active Record
 * @author  <your-name-here>
 */
class ContaPagar extends TRecord
{
    const TABLENAME = 'conta_pagar';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'serial'; // max = id +1 | serial = id na tabela no banco de dados
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('dt_emissao');
        parent::addAttribute('dt_vencimento');
        parent::addAttribute('dt_pagamento');
        parent::addAttribute('forma_recebimento');
        parent::addAttribute('pessoa_id');
        parent::addAttribute('valor');
        parent::addAttribute('desconto');
        parent::addAttribute('valor_total');
        parent::addAttribute('ano');
        parent::addAttribute('mes');
        parent::addAttribute('obs');
        parent::addAttribute('ativo');
        parent::addAttribute('origem');
    }

    public function get_favorecido()
    {
        return Favorecido::find($this->pessoa_id);
    }
}
