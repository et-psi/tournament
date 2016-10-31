<?php
/*
 * Le reset fonctionne malgré la rémanence
 * le type reset devient submit et a un nom
 * On teste pour savoir si c'est ce bouton qui
 * a déclenché le submit
 */
$erreurUsr = '';
$erreurPwd = '';
$badUser = '';
$email = '';
$pwd = '';
/*
// Si on est passé par le formulaire
// on vérifie les champs obligatoires
if (isset($_POST['formulaire'])) {
    // Si c'est abort
    if (isset($_POST['abort'])) {
        header('Location: liste.php');
        exit;
    }
    // Si ce n'est pas reset...
    if (!isset($_POST['reset'])) {
        $email = $_POST['usr'];
        $pwd = $_POST['pwd'];
        if ($email == '') {
            $erreurUsr = '<label class="warning">* Saisie obligatoire</label>';
        }
        if ($pwd == '') {
            $erreurPwd = '<label class="warning">* Saisie obligatoire</label>';
        }
        //C'est le bon user on passe à la page principale
        if ($email == 'admin' && $pwd == 'admin') {
            session_start();
            $_SESSION['admin'] = 'ok';
            header('Location: liste.php');
            exit;
        }
        // Ce n'est pas le bon utilisateur mais il y a eu saisie usr et pwd
        if ($email != '' && $pwd != '') {
            $badUser = '<p><label class="warning">Utilisateur inconnu</label></p>';
        }
    }
}
*/
?>
<!DOCTYPE html>

<html lang="fr"> 
    <head> 
        <meta charset="utf-8" />
        <meta name="DCTERMS.creator" content="P. Sacchetti" />
        <meta name="DCTERMS.subject" content="Android Test http" />
        <meta name="DCTERMS.created" content="2016-11-01" />
        <title>Adnroid test login php</title>
        <link rel="stylesheet" href="css/horaires.css" type="text/css" />
    </head>

    <body> 
        <h1>login</h1>
        <p>(email=john.doe@gmail.ch pwd=pass)</p>
        <form method="post" action="login.php">
            <p>
                <label class="titre">email :</label>
                <input type="text" name="email" value="<?php echo $email ?>">
                <?php echo $erreurUsr ?>
            </p>
            <p>
                <label class="titre">password :</label>
                <input type="password" name="password" value="<?php echo $pwd ?>">
                <?php echo $erreurPwd ?>
            </p>
            <?php echo $badUser ?>
            <p id="boutons_login">
                <input type="submit" value="login">
                <input type="submit" value="clear" name="reset">
                <input type="submit" value="abort" name="abort">
            </p>
            <p> <!-- Ce champ permet de savoir si on est passé par le formulaire -->
                <input type="hidden" name="formulaire" value="ok">
            </p>
        </form>
    </body> 
</html>
