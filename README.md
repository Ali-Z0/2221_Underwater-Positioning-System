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
* [Améliorations et correctifs](#améliorations-et-correctifs)
* [Affiliations](#acknowledgements)
* [Contact](#contact)
<!-- * [License](#license) -->


## Information générales
Ce projet consiste en un carte éléctronique embarquée dont l'objectif est de stocker des données de mesures du déplacement d'un module sous-marin
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
- Batterie, autonomie minimum de 2 heures [10C].
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
How does one go about using it?
Provide various use cases and code examples here.

`write-your-code-here`


## Statut du projet
Project is: _in progress_ / _complete_ / _no longer being worked on_. If you are no longer working on it, provide reasons why.


## Room for Improvement
Include areas you believe need improvement / could be improved. Also add TODOs for future development.

Room for improvement:
- Improvement to be done 1
- Improvement to be done 2

To do:
- Feature to be added 1
- Feature to be added 2


## Acknowledgements
Give credit here.
- This project was inspired by...
- This project was based on [this tutorial](https://www.example.com).
- Many thanks to...


## Contact
Created by [@flynerdpl](https://www.flynerd.pl/) - feel free to contact me!


<!-- Optional -->
<!-- ## License -->
<!-- This project is open source and available under the [... License](). -->

<!-- You don't have to include all sections - just the one's relevant to your project -->
