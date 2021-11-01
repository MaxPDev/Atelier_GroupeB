<?php

namespace app\auth;

use mf\auth\exception\AuthentificationException as AuthentificationException;
use app\model\User as User;

class AppAuthentification extends \mf\auth\Authentification {

    /*
     * Classe AppAuthentification qui définie les méthodes qui dépendent
     * de l'application (liée à la manipulation du modèle User) 
     *
     */

    /* niveaux d'accès de l'App 
     *
     * Le niveau USER correspond a un utilisateur inscrit avec un compte
     * Le niveau ADMIN est un plus haut niveau (non utilisé ici)
     * 
     * Ne pas oublier le niveau NONE un utilisateur non inscrit est hérité 
     * depuis AbstractAuthentification 
     */
    const ACCESS_LEVEL_USER  = 100;   
    const ACCESS_LEVEL_ADMIN = 200;

    /* constructeur */
    public function __construct()
    {
        parent::__construct();
    }

    /* La méthode createUser 
     * 
     *  Permet la création d'un nouvel utilisateur de l'application
     * 
     *  
     * @param : $username : le nom d'utilisateur choisi 
     * @param : $pass : le mot de passe choisi 
     * @param : $fullname : le nom complet 
     * @param : $level : le niveaux d'accès (par défaut ACCESS_LEVEL_USER)
     *  
     */
    
    public function createUser($username, $pass, $fullname,
                               $level=self::ACCESS_LEVEL_USER) 
    {

        
        if(User::select()->where('username','=',"$username")->exists()) {
            $emess = "User $username already exists";
            throw new AuthentificationException($emess);
        } else {
            $new_user = new User();
            $new_user->username = $username;
            $new_user->password = $this->hashPassword($pass);
            $new_user->fullname = $fullname;
            $new_user->level= $level;
            $new_user->followers = 0;
            $new_user->save();

        }

    }

    /* La méthode loginUser
     *  
     * permet de connecter un utilisateur qui a fourni son nom d'utilisateur 
     * et son mot de passe (depuis un formulaire de connexion)
     *
     * @param : $username : le nom d'utilisateur   
     * @param : $password : le mot de passe tapé sur le formulaire
     *
     */
    
    public function loginUser($username, $password)
    {

        $user = User::where("username",$username)->first();
        if(empty($user)) {
            $emess = "User $username doesn't exist";
            throw new AuthentificationException($emess);
        } else {
            $this->login($user->username, $user->password, $password, $user->level);
            // return $user;
        }

    }

}
