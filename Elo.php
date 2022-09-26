<?php
    define('K',16);
    $server = "localhost";
    $username = "root";
    $password = "";
    $dbName = "dbuser";
    $connect = new PDO("mysql:host=$server;dbname=$dbName;",$username,$password);
    $wonName = $_REQUEST['wonName'];
    $wonCompany = $_REQUEST['wonCompany'];
    $wonStock = $_REQUEST['wonStock'];
    $wonRate = $_REQUEST['wonRate'];
    $wonId = $_REQUEST['wonId'];
    $lossName = $_REQUEST['lossName'];
    $lossCompany = $_REQUEST['lossCompany'];
    $lossStock = $_REQUEST['lossStock'];
    $lossRate = $_REQUEST['lossRate'];
    $lossId = $_REQUEST['lossId'];
    $Ea = $_REQUEST['Ea'];
    try{
        $connect->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        /*
        $query = "CREATE TABLE `Goods` (ID INT NOT NULL AUTO_INCREMENT , name VARCHAR(20) NOT NULL ,
         company VARCHAR(30) NOT NULL ,
         stock INT NOT NULL , rate INT NOT NULL DEFAULT '0' , PRIMARY KEY (ID)) ENGINE = InnoDB;";
        // $query = "DROP TABLE dbuser;";
        */
        $isExistW = checkExist($wonId,$connect);
        $isExistL = checkExist($lossId,$connect);
        if($isExistW && $isExistL){
            $changeRateW = K*(1 - $Ea);
            $changeRateL = K*(0 - $Ea);
            updateRate($wonId ,$connect ,$changeRateW);
            updateRate($lossId ,$connect ,$changeRateL);
            $floor = $wonRate - 2.0;
            $ceil = $wonRate + 8.0;
            $counterRateOk = 0;
            $rateQuery = "SELECT * FROM `Goods`
                WHERE $floor <= `rate` AND `rate` <= $ceil;";
            $res = $connect->query($rateQuery);
            while($rowRateCheck = $res->fetch()){
                $counterRateOk++;
            }
            if($counterRateOk > 0){
                $numId = rand(1,$counterRateOk);
                $counterChoice = 1;
                $res = $connect->query($rateQuery);
                while($rowFetchChoice = $res->fetch()){
                    if($counterChoice == $numId){
                        echo json_encode($rowFetchChoice['name']."_".$rowFetchChoice['company']."_".
                        $rowFetchChoice['stock']."_".$rowFetchChoice['rate']."_".$rowFetchChoice['ID']);
                        break;
                    }
                    $counterChoice++;
                }
            }else
                echo "NULL_NULL_0_0_0";

        }
        else
            echo "Null_Null_Null_Null_Null";
    }catch(PDOException $val){
        echo $val;
    }
    $connect = null;

    function checkExist (int $id,PDO $connection):bool{
        $checkQuery = "SELECT * FROM `Goods` WHERE `id` = $id;";
        $res = $connection->query($checkQuery);
        $counterRow = 0;
        while($rowNumCheck = $res->fetch()){
            $counterRow++;
        }
        if($counterRow > 0)
            return true;
        else
            return false;
    }

    function updateRate (int $id ,PDO $connection ,float $ch){
        $ch = number_format($ch , 1);
        $query = "UPDATE `Goods` SET `rate` = `rate` + $ch
        WHERE `ID` = $id;";
        $connection->exec($query);
    }
?>