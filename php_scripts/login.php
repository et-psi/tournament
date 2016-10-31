<?php

if($_SERVER['REQUEST_METHOD']=='POST'){
	//Getting values 
	//$email = $_POST['email'];
	//$password = $_POST['password'];
	
	$email = filter_input(INPUT_POST, 'email');
	$password = filter_input(INPUT_POST, 'password');


	//importing dbConnect.php script 
	require_once('lib/connexion.inc.php');
	$cnn = getConnexion('tournoi_bd');
	if (!$cnn) {
		echo "failure 1";
		exit;
	}

	try {
		//Creating sql query
		$stmt = $cnn->prepare('SELECT email, password FROM tbl_users WHERE email=:email AND password=:password');
		$stmt->bindValue(':email', $email, PDO::PARAM_STR);
		$stmt->bindValue(':password', $password, PDO::PARAM_STR);
		
		//executing query
		$stmt->execute();
		if($row = $stmt->fetch(PDO::FETCH_OBJ)) {
			//displaying success 
			echo "success";
		}else{
			//displaying failure
			echo "failure 2";
		}		
		$stmt->closeCursor();
		
	} catch (PDOException $e) {
			//displaying failure
			echo "failure 3";
	}

}

?>
