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
  $idIdentificateur = $data['idIdentificateur'];

    $query="INSERT INTO `vendeurs`(`nomVendeur`, `postnomVendeur`, `sexeVendeur`, `ageVendeur`,`telephoneVendeur`, `adresseVendeur`,`idIdentificateur`) 
       VALUES (?,?,?,?,?,?,?)";

if($app->prepare($query,[$nomVendeur,$postnomVendeur,$sexeVendeur,$ageVendeur,$telephoneVendeur,$adresseVendeur,$idIdentificateur],1)){
   echo json_encode($app->fetchPrepared("select * from vendeurs"));
}else{
       echo json_encode(array("data"=>"Echec de l'enregistrement"));

}

?>