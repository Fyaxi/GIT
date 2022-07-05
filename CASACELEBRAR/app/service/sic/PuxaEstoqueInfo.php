<?php
class PuxaEstoqueInfo
{
    public static function getBookByCollection()
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT PRODUND.name, count(*)
                                  FROM PRODUND_ID, PRODUND
                                 WHERE PRODUND_ID.system_unit_id = PRODUND.id
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
    
    public static function getBookByClassification()
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT PRODGRUPOS.name, count(*)
                                  FROM PRODGRUPO_ID, PRODGRUPOS
                                 WHERE PRODGRUPO_ID.system_group_id = PRODGRUPOS.id
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

    public static function getPagarRelatorioGp()
    {
        $conn = TTransaction::get();
        $result = $conn->query("SELECT CENTROCUSTO_P.name, count(*)
                                  FROM CENTROCUSTO_P_ID, CENTROCUSTO_P
                                 WHERE CENTROCUSTO_P_ID.system_group_id = CENTROCUSTO_P.id
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
