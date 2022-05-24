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
  $idProducteur = $data['idProducteur'];

    $query="UPDATE `producteurs` SET `nomProducteur`='$nomProducteur', `postnomProducteur`='$postnomProducteur', `sexeProducteur`='$sexeProducteur', `ageProducteur`='$ageProducteur', `telephoneProducteur`='$telephoneProducteur', `adresseProducteur`='$adresseProducteur' WHERE idProducteur = '$idProducteur'";

   echo json_encode($app->fetchPrepared($query));
    

?>