<?php
    include "connexion.php";
    $app=new App('id17633879_iita');
    $data=json_decode(file_get_contents('php://input'),true);

  $nomTransformateur=$data['nomTransformateur'];
  $postnomTransformateur=$data['postnomTransformateur'];
  $sexeTransformateur=$data['sexeTransformateur'];
  $ageTransformateur=$data['ageTransformateur'];
  $telephoneTransformateur = $data['telephoneTransformateur'];
  $adresseTransformateur = $data['adresseTransformateur'];
  $typeTransformateur = $data['typeTransformateur'];
  $idIdentificateur = $data['idIdentificateur'];

    $query="INSERT INTO `transformateurs`(`nomTransformateur`, `postnomTransformateur`, `sexeTransformateur`, `ageTransformateur`, `telephoneTransformateur`, `adresseTransformateur`, `typeTransformateur`,`idIdentificateur`) 
       VALUES (?,?,?,?,?,?,?,?)";

if($app->prepare($query,[$nomTransformateur,$postnomTransformateur,$sexeTransformateur,$ageTransformateur,$telephoneTransformateur,$adresseTransformateur,$typeTransformateur,$idIdentificateur],1)){
   echo json_encode($app->fetchPrepared("select * from transformateurs"));
}else{
       echo json_encode(array("data"=>"Echec de l'enregistrement"));

}

?>