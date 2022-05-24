<?php
    include "connexion.php";
    $app=new App('id17633879_iita');
    $data=json_decode(file_get_contents('php://input'),true);

   $nom_complet=$data['nom_complet'];
   $id=$data['idIdentificateur'];
   $login=$data['login'];
   $mdp=$data['mdp'];
   $adresse = $data['adresse'];
   $age = $data['age'];
   $telephone = $data['telephone'];


    $query="UPDATE `identificateurs` SET `nom_complet`='$nom_complet', `login`='$login', `mdp`='$mdp', `adresse`='$adresse', `age`='$age', `telephone`='$telephone' WHERE idIdentificateur = '$id'";

   echo json_encode($app->fetchPrepared($query));

?>