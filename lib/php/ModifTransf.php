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
  $idTransformateur = $data['idTransformateur'];

    $query="UPDATE `transformateurs` SET `nomTransformateur`='$nomTransformateur', `postnomTransformateur`='$postnomTransformateur', `sexeTransformateur`='$sexeTransformateur', `ageTransformateur`='$ageTransformateur', `telephoneTransformateur`='$telephoneTransformateur', `adresseTransformateur`='$adresseTransformateur' WHERE idTransformateur = '$idTransformateur'";

   echo json_encode($app->fetchPrepared($query));
?>