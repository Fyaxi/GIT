<?php
class PuxaReceberAll
{
    public static function PuxaReceberGeralFunc($year)
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT strftime('%m',DATAGRAFICO),
                                       sum(preco)
                                  FROM CONTASRECEBER
                                 WHERE strftime('%Y', DATAGRAFICO) = '$year' AND active = 'Y'
                                 GROUP BY 1
                                 ORDER BY 1");
        
        $data = [];
        if ($result)
        {
            foreach ($result as $row)
            {
                $month  = $row[0];
                $count  = $row[1];
                
                $data[ $month ] = (float) $count;
                //echo $month;
                //echo $count;
            }
        }
        
        return $data;
    }

    public static function PuxaReceberGeralDiarioFunc($year)
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT TIPOSPAGAMENTOS_R.id, count(*)
                                FROM TIPOSPAGAMENTOS_R_ID, TIPOSPAGAMENTOS_R
                                WHERE TIPOSPAGAMENTOS_R_ID.system_unit_id = TIPOSPAGAMENTOS_R.id
                                GROUP BY 1");
        
        $data = [];
        if ($result)
        {
            foreach ($result as $row)
            {
                $month  = $row[0];
                $count  = $row[1];
                
                $data[ $month ] = (float) $count;
            }
        }
        
        return $data;
    }

    public static function PuxaReceberGeralDiaFunc($year)
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT strftime('%m',DATAGRAFICO),
                                       sum(preco)
                                  FROM CONTASRECEBER
                                 WHERE strftime('%d', DATAGRAFICO) = '$year'  AND active = 'Y'
                                 GROUP BY 1
                                 ORDER BY 1");
        
        $data = [];
        if ($result)
        {
            foreach ($result as $row)
            {
                $month  = $row[0];
                $count  = $row[1];
                
                $data[ $month ] = (float) $count;
            }
        }
        
        return $data;
    }

    public static function getReceberRelatorioGp()
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT CENTROCUSTO_R.name, count(*)
                                  FROM CENTROCUSTO_R_ID, CENTROCUSTO_R
                                 WHERE CENTROCUSTO_R_ID.system_group_id = CENTROCUSTO_R.id
                              GROUP BY 1");
        
        $data = [];
        if ($result)
        {
            foreach ($result as $row)
            {
                $name  = $row[0];
                $value = $row[1];
                
                $data[ $name ] = (int) $value;
            }
        }
        
        return $data;
    }
}