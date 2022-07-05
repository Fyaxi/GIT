<?php
class Caixa
{
    public static function BaterCaixa($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query("   SELECT SUM(mov_valor) FROM CAIXA_MOV
                                        WHERE mov_data BETWEEN '$Data' AND '$DataFechamento' ");
        if ($resultCaixa)
        {
            foreach ($resultCaixa as $row)
            {
                $SomaTotalCaixa  = $row[0];
            }
        }
        
        return $SomaTotalCaixa;
    }

    public static function BaterCaixaRev($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_REV_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixa)
        {
            foreach ($resultCaixa as $row)
            {
                $SomaTotalCaixa  = $row[0];
            }
        }
        
        return $SomaTotalCaixa;
    }

    public static function BaterCaixaDinheiro($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaDinheiro = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA = 2
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaDinheiro)
        {
            foreach ($resultCaixaDinheiro as $row)
            {
                $SomaTotalCaixaDinheiro  = $row[0];
            }
        }
        
        return $SomaTotalCaixaDinheiro;
    }

    public static function BaterCaixaDinheiroRev($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaDinheiro = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_REV_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA = 2
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaDinheiro)
        {
            foreach ($resultCaixaDinheiro as $row)
            {
                $SomaTotalCaixaDinheiro  = $row[0];
            }
        }
        
        return $SomaTotalCaixaDinheiro;
    }

    public static function BaterCaixaCombinar($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaCombinar = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA = 3
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaCombinar)
        {
            foreach ($resultCaixaCombinar as $row)
            {
                $SomaTotalCaixaCombinar  = $row[0];
            }
        }
        
        return $SomaTotalCaixaCombinar;
    }

    public static function BaterCaixaCombinarRev($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaCombinar = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_REV_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA = 3
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaCombinar)
        {
            foreach ($resultCaixaCombinar as $row)
            {
                $SomaTotalCaixaCombinar  = $row[0];
            }
        }
        
        return $SomaTotalCaixaCombinar;
    }

    public static function BaterCaixaCredito($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaCredito = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA = 4
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaCredito)
        {
            foreach ($resultCaixaCredito as $row)
            {
                $SomaTotalCaixaCredito  = $row[0];
            }
        }
        
        return $SomaTotalCaixaCredito;
    }

    public static function BaterCaixaCreditoRev($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaCredito = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_REV_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA = 4
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaCredito)
        {
            foreach ($resultCaixaCredito as $row)
            {
                $SomaTotalCaixaCredito  = $row[0];
            }
        }
        
        return $SomaTotalCaixaCredito;
    }

    public static function BaterCaixaDebito($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaDebito = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA = 5
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaDebito)
        {
            foreach ($resultCaixaDebito as $row)
            {
                $SomaTotalCaixaDebito  = $row[0];
            }
        }
        
        return $SomaTotalCaixaDebito;
    }

    public static function BaterCaixaDebitoRev($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaDebito = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_REV_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA = 5
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaDebito)
        {
            foreach ($resultCaixaDebito as $row)
            {
                $SomaTotalCaixaDebito  = $row[0];
            }
        }
        
        return $SomaTotalCaixaDebito;
    }

    public static function BaterCaixaTransf($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaTransf = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA > 5
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaTransf)
        {
            foreach ($resultCaixaTransf as $row)
            {
                $SomaTotalCaixaTransf  = $row[0];
            }
        }
        
        return $SomaTotalCaixaTransf;
    }

    public static function BaterCaixaTransfRev($CaixaID, $Data, $DataFechamento)
    {
        $conn = TTransaction::get();
        $resultCaixaTransf = $conn->query("   SELECT SUM(PROD_PRECO) FROM CAIXA_REV_MOV
                                        WHERE PED_DATA BETWEEN '$Data' AND '$DataFechamento' 
                                        AND PG_FORMA > 5
                                        AND PROD_BAIXA = 'N' ");
        if ($resultCaixaTransf)
        {
            foreach ($resultCaixaTransf as $row)
            {
                $SomaTotalCaixaTransf  = $row[0];
            }
        }
        
        return $SomaTotalCaixaTransf;
    }

    public static function aRecenerGeraRelatorio($Nome, $Razao, $CodPesquisa, $Preco, $active)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" INSERT INTO 
                                      CONTASRECEBER(name, RAZAO, cod_pesquisa, preco, active, DATA, DATAGRAFICO)
                                      VALUES('$Nome', $Razao, $CodPesquisa, $Preco, '$active', strftime('%d-%m-%Y', 'now'), strftime('%Y-%m-%d', 'now') ) ");

        $conn2 = TTransaction::get();
        $resultCaixa2 = $conn2->query(" SELECT id 
                                        FROM CONTASRECEBER
                                        WHERE id = (SELECT MAX(id) FROM CONTASRECEBER)");
        if ($resultCaixa2)
        {
            foreach ($resultCaixa2 as $row)
            {
                $PegaUltimoIdRecebimento  = $row[0];
            }
        }
        //echo $PegaUltimoIdRecebimento;
        return $PegaUltimoIdRecebimento;
    }

    public function aRecenerGeraRelatorioPagamento($MovId, $MovUnit)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" INSERT INTO 
                                      TIPOSPAGAMENTOS_R_ID(system_user_id, system_unit_id)
                                      VALUES($MovId, $MovUnit)");
    }

    public function aRecenerGeraRelatorioCentroCusto($MovId1, $MovUnit1)
    {
        //echo 'MovFinanceiro ID: '.$MovId1.'</br>';
        //echo 'Centro Custo ID: '.$MovUnit1.'</br>';
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" INSERT INTO 
                                      CENTROCUSTO_R_ID(system_user_id, system_group_id)
                                      VALUES($MovId1, $MovUnit1)");
    }

    public function FuncZerarMovCaixaRev($_CaixaID, $_DataA, $_DataF)
    {
        //echo 'Caixa ID: '.$_CaixaID.'<br>';
        //echo 'Data Abertura: '.$_DataA.'<br>';
        //echo 'Data Fechamento: '.$_DataF.'<br>';
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" UPDATE CAIXA_REV_MOV 
                                      SET PROD_BAIXA = 'Y'
                                      WHERE CAIXA_ID = $_CaixaID ");
    }

    public function FuncZerarMovCaixa($_CaixaID, $_DataA, $_DataF)
    {
        $conn = TTransaction::get();
        $resultCaixa = $conn->query(" UPDATE CAIXA_MOV 
                                      SET PROD_BAIXA = 'Y'
                                      WHERE CAIXA_ID = $_CaixaID ");
    }
}