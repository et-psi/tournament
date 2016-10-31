<?php

/*
  CPLN-ET
  P. Sacchetti
  Fonction de connexion à une base de données.
  Retourne l'objet connecté sur la base de données.
 */

function getConnexion($dataBaseName) {
	$ini=parse_ini_file('/cfg/db.ini');
    try {
        $dbh = new PDO('mysql:host='.$ini['host'].';dbname=' . $dataBaseName, $ini['user'], $ini['password']);
        $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $dbh->exec("SET CHARACTER SET utf8");
        return $dbh;
    } catch (PDOException $e) {
        return false;
    }
}

?>