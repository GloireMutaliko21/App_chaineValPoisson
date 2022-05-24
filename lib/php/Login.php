<?php

    include "connexion.php";

    $app = new App('id17633879_iita');
    $data = json_decode(file_get_contents('php://input'),true);

        $login = $data['login'];
        $mdp = $data['mdp'];

        $querry = "SELECT * FROM admin WHERE login = '$login' AND mdp = '$mdp'";

        echo json_encode($app->fetchPrepared($querry));

?>