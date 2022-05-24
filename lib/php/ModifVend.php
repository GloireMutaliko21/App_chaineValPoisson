<?php
    include "connexion.php";
    $app=new App('id17633879_iita');
    $data=json_decode(file_get_contents('php://input'),true);

  $nomVendeur=$data['nomVendeur'];
  $postnomVendeur=$data['postnomVendeur'];
  $sexeVendeur=$data['sexeVendeur'];
  $ageVendeur=$data['ageVendeur'];
  $telephoneVendeur = $data['telephoneVendeur'];
  $adresseVendeur = $data['adresseVendeur'];
  $idVendeur = $data['idVendeur'];

  $query="UPDATE `vendeurs` SET `nomVendeur`='$nomVendeur', `postnomVendeur`='$postnomVendeur', `sexeVendeur`='$sexeVendeur', `ageVendeur`='$ageVendeur', `telephoneVendeur`='$telephoneVendeur', `adresseVendeur`='$adresseVendeur' WHERE idVendeur = '$idVendeur'";

   echo json_encode($app->fetchPrepared($query));
    

?>