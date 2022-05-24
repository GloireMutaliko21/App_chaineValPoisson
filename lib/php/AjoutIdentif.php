<?php
    include "connexion.php";
    $app=new App('id17633879_iita');
    $data=json_decode(file_get_contents('php://input'),true);

   $nom_complet=$data['nom_complet'];
   $login=$data['login'];
   $mdp=$data['mdp'];
   $sexe=$data['sexe'];
   $adresse = $data['adresse'];
   $age = $data['age'];
   $telephone = $data['telephone'];

$query="INSERT INTO `identificateurs`(`nom_complet`, `login`, `mdp`, `sexe`, `adresse`, `age`, `telephone`) 
       VALUES (?,?,?,?,?,?,?)";

if($app->prepare($query,[$nom_complet,$login,$mdp,$sexe,$adresse,$age,$telephone],1)){
   echo json_encode($app->fetchPrepared("select * from identificateurs"));
}else{
       echo json_encode(array("data"=>"Echec de l'enregistrement"));

}

?>