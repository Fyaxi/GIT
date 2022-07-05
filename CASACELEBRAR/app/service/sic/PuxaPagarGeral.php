<?php
class PuxaPagarGeral
{
    public static function PuxaPagarGeralFunc($year)
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT strftime('%m',DATAGRAFICO),
                                       sum(preco)
                                  FROM CONTASPAGAR
                                 WHERE strftime('%Y', DATAGRAFICO) = '$year' AND active = 'N'
                                 GROUP BY 1
                                 ORDER BY 1");
        
        $data = [];
        if ($result)
        {
            foreach ($result as $row)
            {
                $month  = $row[0];
                $count  = $row[1];
                
                $data[ $month ] = "$".(float) $count;
            }
        }
        
        return $data;
    }

    public static function PegaCaixaID($year)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" SELECT id FROM CAIXA WHERE ID = (SELECT MAX(ID) FROM CAIXA) AND ABERTO = 'Y' ");

        if ($resultCaixa)
        {
            foreach ($resultCaixa as $row)
            {
                $CaixaAberto  = $row[0];
            }
        }
        
        return $CaixaAberto;
    }

    public function MovimentarFinanceiro($_CAIXA_ID, $_PED_ID_CLI, $_PROD_PRECO, $_PROD_DESCONTO, $_PG_FORMA)
    {
        //echo 'Caixa ID: '.$_CAIXA_ID.'<br>';
        //echo 'Ped ID: '.$_PED_ID_CLI.'<br>';
        //echo 'Ped Preço: '.$_PROD_PRECO.'<br>';
        //echo 'Ped Desconto: '.$_PROD_DESCONTO.'<br>';
        //echo 'Pg Forma: '.$_PG_FORMA.'<br><br>';
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" INSERT INTO 
                                      CAIXA_MOV(CAIXA_ID, PED_ID_CLI, PROD_PRECO, PROD_DESCONTO, PG_FORMA, PED_DATA, USUARIO)
                                      VALUES($_CAIXA_ID, $_PED_ID_CLI, $_PROD_PRECO, $_PROD_DESCONTO, $_PG_FORMA, strftime('%d-%m-%Y', 'now'), 'GESTOR') ");
    }

    public static function PegarEstoque($ProdID)
    {
        $conn = TTransaction::get();
        $resultProd = $conn->query(" SELECT qnt_estoque FROM PRODUTOS WHERE ID = $ProdID ");

        if ($resultProd)
        {
            foreach ($resultProd as $row)
            {
                $qntestoque  = $row[0];
            }
        }
        
        return $qntestoque;
    }

    public function SubirNovoEstoque($ProdID, $ProdNovoEstoque)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" UPDATE PRODUTOS 
                                      SET qnt_estoque = $ProdNovoEstoque
                                      WHERE ID = $ProdID ");
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////
    // MOVIMENTAÇÃO REVENDEDORES
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public static function PegarVendasRev($_REV_ID)
    {
        $conn = TTransaction::get();
        $resultProd1 = $conn->query(" SELECT QNT_VENDAS FROM TABVENDAS WHERE REV_ID = $_REV_ID ");

        if ($resultProd1)
        {
            foreach ($resultProd1 as $row)
            {
                $Rev_Vendas  = $row[0];
            }
        }
        
        return $Rev_Vendas;
    }

    public function SubirVendasRev($_REV_ID, $_QNT_VENDAS)
    {
        $conn = TTransaction::get();
        $resultCaixa01 = $conn->query(" SELECT QNT_VENDAS FROM TABVENDAS WHERE REV_ID = $_REV_ID ");
        //echo $resultCaixa01;

        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" UPDATE TABVENDAS 
                                      SET QNT_VENDAS = $_QNT_VENDAS
                                      WHERE REV_ID = $_REV_ID ");
    }

    public function FuncMovTABVENDAS($_REV_ID)
    {
        $PegaVendasRevendedor = PuxaPagarGeral::PegarVendasRev( $_REV_ID );
        $NEWPegaVendasRevendedor = $PegaVendasRevendedor + 1;
        PuxaPagarGeral::SubirVendasRev( $_REV_ID, (int) $NEWPegaVendasRevendedor );
    }

    public function MovimentarFinanceiroRev($_CAIXA_ID, $_PED_ID_REV, $_PROD_PRECO, $_PROD_DESCONTO, $_PG_FORMA)
    {
        //echo 'Caixa ID: '.$_CAIXA_ID.'<br>';
        //echo 'Ped ID: '.$_PED_ID_REV.'<br>';
        //echo 'Ped Preço: '.$_PROD_PRECO.'<br>';
        //echo 'Ped Desconto: '.$_PROD_DESCONTO.'<br>';
        //echo 'Pg Forma: '.$_PG_FORMA.'<br><br>';
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" INSERT INTO 
                                      CAIXA_REV_MOV(CAIXA_ID, PED_ID_REV, PROD_PRECO, PROD_DESCONTO, PG_FORMA, PED_DATA, USUARIO)
                                      VALUES($_CAIXA_ID, $_PED_ID_REV, $_PROD_PRECO, $_PROD_DESCONTO, $_PG_FORMA, strftime('%d-%m-%Y', 'now'), 'GESTOR') ");
    }

    public static function PegaCaixaIDRev($year)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" SELECT id FROM CAIXA_REV WHERE ID = (SELECT MAX(ID) FROM CAIXA_REV) AND ABERTO = 'Y' ");

        if ($resultCaixa)
        {
            foreach ($resultCaixa as $row)
            {
                $CaixaAbertoRevendedor  = $row[0];
            }
        }
        
        return $CaixaAbertoRevendedor;
    }

    public function FuncAddRanking($_REV_ID)
    {
        $PegaVendasRevendedor = PuxaPagarGeral::PegarVendasRev( $_REV_ID );
        //echo 'Rev ID: '.$_REV_ID.'<br>Nº Total Vendas: '.$PegaVendasRevendedor.'<br>';

        if($PegaVendasRevendedor < 90)
        {
            $RevPagamentoSemMeta = 0;
            $ComissaoKG = $PegaVendasRevendedor * 3;

            $RevPagamentoSemMeta = $ComissaoKG;
            //echo 'Sem Meta: '.$RevPagamentoSemMeta.'<br>';

            $conn = TTransaction::get();
            $InsertSemMeta = $conn->query(" UPDATE TABVENDAS
                                      SET REV_COMISSAO = $RevPagamentoSemMeta, REV_META = 0, REV_PG = $RevPagamentoSemMeta
                                      WHERE ID = $_REV_ID ");
        } 
        else if($PegaVendasRevendedor > 89 && $PegaVendasRevendedor < 150)
        {
            $MetaBronzeBatida = 40;
            $ComissaoKGBronze = $PegaVendasRevendedor * 3;
            //echo 'Comissão Bronze: '.$ComissaoKGBronze.'<br>';

            $RevPagamentoBronze = $ComissaoKGBronze + $MetaBronzeBatida;
            //echo 'Meta Bronze: '.$RevPagamentoBronze.'<br>';

            $conn = TTransaction::get();
            $InsertSemMeta = $conn->query(" UPDATE TABVENDAS
                                      SET REV_COMISSAO = $ComissaoKGBronze, REV_META = 1, REV_PG = $RevPagamentoBronze
                                      WHERE ID = $_REV_ID ");
        }
        else if($PegaVendasRevendedor > 149 && $PegaVendasRevendedor < 200)
        {
            $RevPagamentoPrata = 0;
            $MetaPrataBatida = 50;
            $ComissaoKGPrata = $PegaVendasRevendedor * 4;
            //echo 'Comissão Prata: '.$ComissaoKGPrata.'<br>';

            $RevPagamentoPrata = $ComissaoKGPrata + $MetaPrataBatida;
            //echo 'Meta Prata: '.$RevPagamentoPrata.'<br>';

            $conn = TTransaction::get();
            $InsertSemMeta = $conn->query(" UPDATE TABVENDAS
                                      SET REV_COMISSAO = $ComissaoKGPrata, REV_META = 2, REV_PG = $RevPagamentoPrata
                                      WHERE ID = $_REV_ID ");
        }
        else if($PegaVendasRevendedor > 199)
        {
            $RevPagamentoGold = 0;
            $MetaGoldBatida = 80;
            $ComissaoKGGold = $PegaVendasRevendedor * 5;
            //echo 'Comissão Gold: '.$ComissaoKGGold.'<br>';

            $RevPagamentoGold = $ComissaoKGGold + $MetaGoldBatida;
            //echo 'Meta Gold: '.$RevPagamentoGold.'<br>';

            $conn = TTransaction::get();
            $InsertSemMeta = $conn->query(" UPDATE TABVENDAS
                                      SET REV_COMISSAO = $ComissaoKGGold, REV_META = 3, REV_PG = $RevPagamentoGold
                                      WHERE ID = $_REV_ID ");
        }
    }

    public static function FuncCheckRanking($_REV_ID)
    {
        $PegaVendasRevendedor = PuxaPagarGeral::PegarVendasRev( $_REV_ID );

        if($PegaVendasRevendedor < 90)
        {
            // SEM META MENSAL
            return 0;
        } 
        else if($PegaVendasRevendedor > 89 && $PegaVendasRevendedor < 150)
        {
            // META BRONZE MENSAL
            return 1;
        }
        else if($PegaVendasRevendedor > 149 && $PegaVendasRevendedor < 200)
        {
            // META PRATA MENSAL
            return 2;
        }
        else if($PegaVendasRevendedor > 199)
        {
            // META OURO MENSAL
            return 3;
        }
    }

    // MOVIMENTAÇÃO REVENDEDORES
    public static function PegarVendasRevSem($_REV_ID)
    {
        $conn = TTransaction::get();
        $resultProd1 = $conn->query(" SELECT QNT_VENDAS FROM TABVENDASEM WHERE REV_ID = $_REV_ID ");

        if ($resultProd1)
        {
            foreach ($resultProd1 as $row)
            {
                $Rev_Vendas  = $row[0];
            }
        }
        
        return $Rev_Vendas;
    }

    public static function FuncCheckRankingSem($_REV_ID)
    {
        $PegaVendasRevendedor = PuxaPagarGeral::PegarVendasRevSem( $_REV_ID );

        if($PegaVendasRevendedor < 23)
        {
            // SEM META SEMANAL
            return 0;
        } 
        else if($PegaVendasRevendedor > 22 && $PegaVendasRevendedor < 39)
        {
            // META BRONZE SEMANAL
            return 1;
        }
        else if($PegaVendasRevendedor > 38 && $PegaVendasRevendedor < 50)
        {
            // META PRATA SEMANAL
            return 2;
        }
        else if($PegaVendasRevendedor > 49)
        {
            // META OURO SEMANAL
            return 3;
        }
    }

    public function SubirVendasRevSem($_REV_ID, $_QNT_VENDAS)
    {
        $conn = TTransaction::get();
        $resultCaixa01 = $conn->query(" SELECT QNT_VENDAS FROM TABVENDASEM WHERE REV_ID = $_REV_ID ");
        //echo $resultCaixa01;

        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" UPDATE TABVENDASEM 
                                      SET QNT_VENDAS = $_QNT_VENDAS
                                      WHERE REV_ID = $_REV_ID ");
    }

    public function FuncMovTABVENDASEM($_REV_ID)
    {
        $PegaVendasRevendedor = PuxaPagarGeral::PegarVendasRevSem( $_REV_ID );
        $NEWPegaVendasRevendedor = $PegaVendasRevendedor + 1;
        PuxaPagarGeral::SubirVendasRevSem( $_REV_ID, (int) $NEWPegaVendasRevendedor );
    }
    
    public function FuncMovTABVENDASEMDEC($_REV_ID)
    {
        $PegaVendasRevendedor = PuxaPagarGeral::PegarVendasRevSem( $_REV_ID );
        $NEWPegaVendasRevendedor = $PegaVendasRevendedor - 1;
        PuxaPagarGeral::SubirVendasRevSem( $_REV_ID, (int) $NEWPegaVendasRevendedor );
    }

    public function FuncAddRankingSemanal($_REV_ID)
    {
        $PegaVendasRevendedor = PuxaPagarGeral::PegarVendasRevSem( $_REV_ID );
        //echo 'Rev ID: '.$_REV_ID.'<br>Nº Total Vendas: '.$PegaVendasRevendedor.'<br>';

        if($PegaVendasRevendedor < 23)
        {
            $ComissaoKG = $PegaVendasRevendedor * 3;

            $conn = TTransaction::get();
            $InsertSemMeta = $conn->query(" UPDATE TABVENDASEM
                                      SET REV_COMISSAO = $ComissaoKG, REV_META = 0
                                      WHERE ID = $_REV_ID ");
        } 
        else if($PegaVendasRevendedor > 22 && $PegaVendasRevendedor < 39)
        {
            $ComissaoKGBronze = $PegaVendasRevendedor * 3;
            //echo 'Comissão Bronze: '.$ComissaoKGBronze.'<br>';

            $conn = TTransaction::get();
            $InsertSemMeta = $conn->query(" UPDATE TABVENDASEM
                                      SET REV_COMISSAO = $ComissaoKGBronze, REV_META = 1
                                      WHERE ID = $_REV_ID ");
        }
        else if($PegaVendasRevendedor > 38 && $PegaVendasRevendedor < 50)
        {
            $ComissaoKGPrata = $PegaVendasRevendedor * 4;
            //echo 'Comissão Prata: '.$ComissaoKGPrata.'<br>';

            $conn = TTransaction::get();
            $InsertSemMeta = $conn->query(" UPDATE TABVENDASEM
                                      SET REV_COMISSAO = $ComissaoKGPrata, REV_META = 2
                                      WHERE ID = $_REV_ID ");
        }
        else if($PegaVendasRevendedor > 50)
        {
            $ComissaoKGGold = $PegaVendasRevendedor * 5;
            //echo 'Comissão Gold: '.$ComissaoKGGold.'<br>';

            $conn = TTransaction::get();
            $InsertSemMeta = $conn->query(" UPDATE TABVENDASEM
                                      SET REV_COMISSAO = $ComissaoKGGold, REV_META = 3
                                      WHERE ID = $_REV_ID ");
        }
    }
}