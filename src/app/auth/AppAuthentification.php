<?php

namespace app\auth;

use mf\auth\exception\AuthentificationException;
use app\model\User;
use app\model\Producer;
use app\model\Manager;

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
    const ACCESS_LEVEL_MANAGER  = 200;   
    const ACCESS_LEVEL_PRODUCER = 100;

    /* constructeur */
    public function __construct()
    {
        parent::__construct();
    }

    /* La méthode loginUser
     *  
     * permet de connecter un utilisateur qui a fourni son nom d'utilisateur 
     * et son mot de passe (depuis un formulaire de connexion)
     *
     * @param : $username : le email d'utilisateur   
     * @param : $password : le mot de passe tapé sur le formulaire
     *
     */
    
    public function loginUser($username, $password)
    {
        $user = User::where("mail",$username)->first();
        if(empty($user)) {
            $emess = "User $username doesn't exist";
            throw new AuthentificationException($emess);
        } else {
            //Check user role
            if(Manager::where('id_user',$user->id)->count()==1){
                $level=200;
            }else{
                $level=100;
            }

            $this->login($user->id, $user->password, $password, $level);
        }

    }

}
