<?php
class PuxaEstoqueGeral
{
    public static function PuxaEstoqueGeralFunc($year)
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT strftime('%m',DTGRAFICO),
                                       count(id)
                                  FROM PEDIDOS
                                 WHERE strftime('%Y', DTGRAFICO) = '$year'
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

    public static function PuxaEstoqueGeralRevFunc($year)
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT strftime('%m',DTGRAFICO),
                                       count(id)
                                  FROM PEDIDOS_REV
                                 WHERE strftime('%Y', DTGRAFICO) = '$year'
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
}