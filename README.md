# 2221_LocalisationSousMarine
> Projet de localisation d'un module sous-marin.
> Démonstration [ici](https://www.example.com). <!-- If you have the project hosted somewhere, include the link here. -->

## Table of Contents
* [Information générales](#information-générales)
* [Technologies utilisées](#technologies-utilisées)
* [Fonctionnalités](#fonctionnalités)
* [Configuration](#configuration)
* [Utilisation](#utilisation)
* [Statut du projet](#statut-du-projet)
* [Améliorations](#améliorations)
* [Contact](#contact)
<!-- * [License](#license) -->


## Information générales
Ce projet consiste en une carte éléctronique embarquée dont l'objectif est de stocker des données de mesures du déplacement d'un module sous-marin
par une centrale inertielle et un capteur pression, afin de mathématiquement le localiser depuis son point de
départ (référence). Ceci, car la localisation sous-marine nest pas une tâche aisée due aux différentes
contraintes de communication sous-marine notamment que les ondes électromagnétiques ne s'y
propagent pas facilement.
<!-- You don't have to answer all the questions - just the ones relevant to your project. -->


## Technologies utilisées
- MPLAB Harmony v2_06
- Microcontrôleur - PIC32MX130F256D
- Centrale inertielle - Bosch BNO055


## Fonctionnalités
List the ready features here:
- Sauvegarde dun set de donnée chaque 100ms.
- Profondeur dutilisation maximum, de 60m.
- 2 heure de logging dans carte SD.
- Sensing sur 9 axes :
  - Accéléromètre 3-axes.
  - Gyroscope 3-axes.
  - Magnétomètre 3-axes.
  - Senseur de température
  - Profondimètre [0->10bar] [Res 1/10]
  - 3 à 5 slots libres MikroE pour autres mesures.
- Possibilité de sauvegarder la localisation de points dintérêts par :
Bouton de sauvegarde [A définir : Magnétique, Optique, Mécanique ou autre].
- Batterie, autonomie minimum de 2 heures.
- Charge de la batterie par connecteur USB.
- Lecture des données par connecteur USB (Interfaçage électronique, software
optionnel dans cette version).
-  Interface LED.

<p align="center" width="100%">
    <img width="60%" src=./doc/rapport/Rapport/Figures/Dev-SCH/Schema-bloc-detail-bkgnd.jpg =100x20">
</p>

## Configuration
La carte éléctronique doit être assemblée en considération des fichiers de fabrication et de la BOM (Bill of materials). Le firmware doit ensuite être implémenté sur dans microcntrôleur PIC et une carte SD doit être insérée, afin de lire les données de déplacement.


## Utilisation
Il faut flâcher le code firmware par le bias de MPLAB-X avec harmony sur le microcontroleur du PCB produit, pour ce faire, il y a un connecteur de programmation BERG. Une fois le code flashé, le module sous-marin peut être utilisé et sous condition qu'une carte SD est insérée, les données de déplacements y seront sauvegardé en format CSV.


## Statut du projet
Le projet est complété mais des améliorations peuvent toujours avoir lieu.


## Améliorations
To do:
- SCK VALABLE QUE A LA PIN 14 aulieu de 20
- CHANGER PIN U2TX (PIN14) POUR UNE AUTRE PIN
- OSCILLATEUR EXTERNE DOIT ETRES CONNECTER COMME OSCILLATEUR SECONDAIRE ET NON PRINCIPALE


## Contact
Créer par Ali Zoubir : ali.zoubir@etml-es.ch

