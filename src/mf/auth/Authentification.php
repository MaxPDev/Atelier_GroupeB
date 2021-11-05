<?php

namespace mf\auth;

// A verifier si le use fonctionne bien !
use mf\auth\exception\AuthentificationException as AuthentificationException;

class Authentification extends AbstractAuthentification {
    
    /* 
     * Le constructeur : 
     * 
     * Faire le lien entre la variable de session et les attributs de la calsse
     *
     *   La variables de session sont les suivante : 
     *    - $_SESSION['user_login'] 
     *    - $_SESSION['access_level'] 
     *    
     */
    public function __construct() 
    {
        if(isset($_SESSION['user_login'])) {
            $this->user_login = $_SESSION['user_login'];
            $this->access_level = $_SESSION['access_level'];
            $this->logged_in = true;
        } else {
            $this->user_login = null;
            $this->access_level = self::ACCESS_LEVEL_NONE;
            $this->logged_in = false;
        }
    }

    /* 
     * La méthode updateSession : 
     *
     * Méthode pour enregistrer la connexion d'un utilisateur dans la session 
     *
     * ATTENTION : cette méthode est appelée uniquement quand la connexion 
     *             réussie par la méthode login (cf. plus bas)
     *
     * @param String : $userId, le login de l'utilisateur  
     * @param String : $level, le niveau d'accès
     */
    public function updateSession($userId, $level) 
    {
        $this->user_login = $userId;
        $this->access_level = $level;
        $this->logged_in = true;

        $_SESSION['user_login'] = $userId;
        $_SESSION['access_level'] = $level;

    }

      /* 
      * la méthode logout :
      * 
      * Méthode pour effectuer la déconnexion : 
      * 
      */
    public function logout() 
    {
        unset($_SESSION['user_login']);
        unset($_SESSION['access_level']);

        $this->user_login = null;
        $this->access_level = self::ACCESS_LEVEL_NONE;
        $this->logged_in = false;
    }

    /* 
     * La méthode checkAccessRight:
     * 
     * Méthode pour verifier le niveau d'accès de l'utilisateur.
     *  
     * @param  int  : $requested, le niveau requis
     * @return bool : vrai si le niveaux requis est inférieur ou égale à la 
     *                valeur du niveau de l'utilisateur 
     */
    public function checkAccessRight($requested) 
    {
        if($requested > $this->access_level) {
            return false;
        } else {
            return true;
        }
    }

    /* 
     * La méthode login:
     * 
     * Méthode qui réalise la connexion d'un utilisateur.
     *
     * @param string : $username, l'identifiant fourni par l'utilisateur
     * @param string : $db_pass, le haché du mot de passe stocké en BD
     * @param string : $pass, le mot de passe fourni par l'utilisateur 
     * @param integer: $level, le niveau d'accès de lutilisateur stocké en BD
     *
     */
    public function login($userId, $db_pass, $given_pass, $level) 
    {

        if(!$this->verifyPassword($given_pass, $db_pass)) {
            $msg_pwd_error = "Wrong password";
            throw new AuthentificationException($msg_pwd_error);
        } else {
            $this->updateSession($userId, $level);
        };

    }

    /* 
     * La méthode hashPassword :
     *
     * Méthode pour hacher un mot de passe
     *  
     * @param  string : $password, le mots de passe en clair
     * @return string : mot de passe haché
     */
    public function hashPassword($password) 
    {
        return password_hash($password, PASSWORD_DEFAULT);
    }

    /* 
     * La méthodes verifyPassword : 
     * 
     * Méthode pour vérifier si un mot de passe est égale a un hache  
     *  
     * @param string : $password, mot de passe non haché (depuis un formulaire)
     * @param string : $hash, le mot de passe haché (depuis BD)
     * @return bool  : vrai si concordance faut sinon
     */
    public function verifyPassword($password, $hash) 
    {
        $verify_password = false;

        if($hash == '')  {
            if($password == $hash) {
                $verify_password = true;
            }
        } else {
            $verify_password = password_verify($password, $hash);
        }
        return $verify_password;
    }
}