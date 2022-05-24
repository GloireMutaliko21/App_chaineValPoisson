<?php
    include "connexion.php";
    $app=new App('id17633879_iita');
    $data=json_decode(file_get_contents('php://input'),true);

  $nomEtang=$data['nomEtang'];
  $ville_territoire=$data['ville_territoire'];
  $longitude=$data['longitude'];
  $latitude = $data['latitude'];
  $idIdentificateur = $data['idIdentificateur'];

    $query="INSERT INTO `etangs`(`nomEtang`, `ville_territoire`, `longitude`,`latitude`,`idIdentificateur`) 
       VALUES (?,?,?,?,?)";

if($app->prepare($query,[$nomEtang,$ville_territoire,$longitude,$latitude,$idIdentificateur],1)){
   echo json_encode($app->fetchPrepared("select * from etangs"));
}else{
       echo json_encode(array("data"=>"Echec de l'enregistrement"));

}

?>