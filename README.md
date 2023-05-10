# symfony_project
*Prérequis sur votre machine pour le bon fonctionnement de ce projet :

PHP Version 8.1 Installer PHP -- Mettre à jour PHP en 8.1 (Ubuntu)
MySQL Installer MySQL ou Installer MariaDB
Symfony version 5.5 minimum avec le CLI(Binaire) Symfony Installer Symfony -- Installer Binaire Symfony
Composer Installer Composer
Npm Installer Npm
Yarn Installer Yarn
Installation
Après avoir cloné le projet avec git clone https://github.com/chengos74/symfony_project.git

Exécutez la commande cd myp_symfony pour vous rendre dans le dossier depuis le terminal.

Ensuite, dans l'ordre taper les commandes dans votre terminal :

1 composer install afin d'installer toutes les dépendances composer du projet.

2 npm install afin d'installer toutes les dépendances npm du projet ou yarn install afin d'installer toutes les dépendances yarn du projet.

3 installer la base de donnée MySQL. Pour paramétrer la création de votre base de donnée, rdv dans le fichier .env du projet, et modifier la variable d'environnement selon vos paramètres :

DATABASE_URL=mysql://User:Password@127.0.0.1:3306/nameDatabasse?serverVersion=8

Puis exécuter la création de la base de donnée avec la commande : symfony console doctrine:database:create

4 Exécuter la migration en base de donnée : symfony console doctrine:migration:migrate
