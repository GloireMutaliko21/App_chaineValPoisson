<?php 
    include "connexion.php";

    $app = new App('id17633879_iita');

    
    $query = "SELECT nomCage, latitude,longitude FROM cages UNION ALL SELECT nomEtang, latitude,longitude FROM etangs";
        echo json_encode($app->fetchPrepared($query));

?>