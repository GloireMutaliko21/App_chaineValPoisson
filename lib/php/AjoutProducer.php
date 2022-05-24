<?php
    include "connexion.php";
    $app=new App('id17633879_iita');
    $data=json_decode(file_get_contents('php://input'),true);

  $nomProducteur=$data['nomProducteur'];
  $postnomProducteur=$data['postnomProducteur'];
  $sexeProducteur=$data['sexeProducteur'];
  $ageProducteur=$data['ageProducteur'];
  $telephoneProducteur = $data['telephoneProducteur'];
  $adresseProducteur = $data['adresseProducteur'];
  $typeProducteur = $data['typeProducteur'];
  $idIdentificateur = $data['idIdentificateur'];

    $query="INSERT INTO `producteurs`(`nomProducteur`, `postnomProducteur`, `sexeProducteur`, `ageProducteur`, `telephoneProducteur`, `adresseProducteur`, `typeProducteur`,`idIdentificateur`) 
       VALUES (?,?,?,?,?,?,?,?)";

if($app->prepare($query,[$nomProducteur,$postnomProducteur,$sexeProducteur,$ageProducteur,$telephoneProducteur,$adresseProducteur,$typeProducteur,$idIdentificateur],1)){
   echo json_encode($app->fetchPrepared("select * from producteurs"));
}else{
       echo json_encode(array("data"=>"Echec de l'enregistrement"));

}

?>