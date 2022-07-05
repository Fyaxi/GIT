<?php
class Cadastros
{
    public function FuncCadTabVendas($_REV_ID)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" INSERT INTO 
                                      TABVENDAS(REV_ID)
                                      VALUES($_REV_ID) ");

        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" INSERT INTO 
                                      TABVENDASEM(REV_ID)
                                      VALUES($_REV_ID) ");
    }
}