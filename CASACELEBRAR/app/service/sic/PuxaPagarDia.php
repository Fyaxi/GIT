<?php
class PuxaPagarDia
{
    public static function PuxaPagarGeralDiaFunc($year)
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT strftime('%m',DATA),
                                       sum(preco)
                                  FROM CONTASPAGAR
                                 WHERE strftime('%d', DATA) = '$year' AND active = 'N'
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