# Le Hangar Local

Groupe B

## Participants

Youssef Bahi (youssef.bahi1@etu.univ-lorraine.fr)

Malek Ben Khalifa (malek.ben-khalifa3@etu.univ-lorraine.fr)

Sebastien Klaus (sebastien.klaus2@etu.univ-lorraine.fr)

Asley Rakotoarison (asley.rakotoarison6@etu.univ-lorraine.fr)

Maxime Piscalgia (maxime.piscaglia1@etu.univ-lorraine.fr)

## Link to Webetu

https://webetu.iutnc.univ-lorraine.fr/www/piscagli5u/Atelier_GroupeB/main.php/home/

## Trello Dashboard

https://trello.com/b/rPx721Ub

## Languages

php v7.4.3
HTML 5
CSS 3 / SCSS

## Set up

- Clone this repository from the main branch on your php serveur
- Download the latest stable composer.phar at https://getcomposer.org/download/ in the repository
- Make composer.phar executable 
`chmod 755 composer.phar`
- Install Eloquent
`./composer.phar require illuminate/database`
- Add this autoload configuration in composer.json file :
`    "autoload": {
        "psr-4": {
            "app\\": "./src/app/",
            "mf\\": "./src/mf/"
        }
    }
`
- Re-generate autoload
`./composer.phar dump-autoload`
- Import the sql file in conf/ in your database
- Add a conf.ini file in conf/ with your database's settings like
`;conf.ini

driver = mysql
host = localhost
database = your_database
username = your_username
password = your_password
charset = utf8
collation = utf8_unicode_ci
prefix =`
- Open main.php/home/ on your web browser

## Others

Producer login :
producer@producer.com

Manager Login :
manager@manager.com

Password for both: 
password
