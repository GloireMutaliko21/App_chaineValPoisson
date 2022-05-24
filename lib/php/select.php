<?php

    include "connexion.php";

    $app = new App('id17633879_iita');
    $event=$_POST['event'];
    
     if($event=='FIND_IDENTIFICATEURS'){
        $query = "SELECT * FROM identificateurs";
        echo json_encode($app->fetchPrepared($query));
    }
     if($event=='FIND_TRANSFORMATEURS'){
        $query = "SELECT * FROM transformateurs";
        echo json_encode($app->fetchPrepared($query));
    }
     if($event=='FIND_VENDEURS'){
        $query = "SELECT * FROM vendeurs";
        echo json_encode($app->fetchPrepared($query));
    }
     if($event=='FIND_PRODUCTEURS'){
        $query = "SELECT * FROM producteurs";
        echo json_encode($app->fetchPrepared($query));
    }
     if($event=='FIND_PRODUCTEURS_ALIMENT'){
        $query = "SELECT * FROM producteurs WHERE typeProducteur = 'Aliment'";
        echo json_encode($app->fetchPrepared($query));
    }
     if($event=='FIND_PRODUCTEURS_ALEVIN'){
        $query = "SELECT * FROM producteurs WHERE typeProducteur = 'Alevin'";
        echo json_encode($app->fetchPrepared($query));
    }
     if($event=='FIND_LOCATION'){
        $query = "SELECT nomCage as nom, latitude,longitude FROM cages UNION ALL SELECT nomEtang as nom, latitude,longitude FROM etangs";
        echo json_encode($app->fetchPrepared($query));
    }
?>