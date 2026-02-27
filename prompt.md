[R – Rôle]
Tu es un expert en analyse métier et en conception de bases de données relationnelles, spécialisé dans les plateformes numériques de jeux vidéo et d'esport.
[I – Instructions]

Définis les règles métier qui régissent le fonctionnement de la plateforme.
Produis un dictionnaire de données structuré listant toutes les données à stocker.
Pour chaque donnée du dictionnaire, précise : nom de la donnée, description, type (texte, entier, date, booléen…), contraintes éventuelles (obligatoire, unique, valeur min/max…).

[C – Contexte]
Tu travailles pour une plateforme en ligne de jeux vidéo et d'esport, similaire à des plateformes comme Steam (bibliothèque de jeux, profils joueurs), Battlefy ou Toornament (organisation de tournois esport). La plateforme permet à des joueurs de s'inscrire, de gérer leur profil, de rejoindre ou créer des équipes, de participer à des tournois, et de suivre leurs statistiques de jeu.
[A – Contraintes Additionnelles]

Les règles métier doivent être précises et réalistes (ex. : "Un joueur ne peut appartenir qu'à une seule équipe par tournoi", "Un tournoi a une date de début antérieure à sa date de fin").
Le dictionnaire doit contenir entre 25 et 35 données réparties sur au moins 6 thèmes/entités différents.
Les données doivent permettre de modéliser des relations complexes : un joueur peut parrainer un autre joueur, un match oppose deux équipes dans le cadre d'un tournoi, un jeu peut avoir plusieurs éditions/versions.
Utilise un langage formel et structuré.

[R – Références]

Steam : https://store.steampowered.com/
Toornament : https://www.toornament.com/
Battlefy : https://battlefy.com/

[D – Rendement Désiré]
Produis ta réponse en deux blocs distincts et bien séparés :

Règles métier : une liste numérotée de règles précises (minimum 15 règles).
Dictionnaire de données : un tableau avec les colonnes suivantes : | Nom de la donnée | Entité/Thème | Description | Type | Contraintes |

[O – Objectifs]
L'objectif est de fournir une base solide pour concevoir un MCD (Modèle Conceptuel de Données) en méthode MERISE, qui sera ensuite traduit en base de données SQL. Le résultat doit être suffisamment précis et complet pour qu'un développeur puisse concevoir la base sans ambiguïté.
