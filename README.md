# Mini-Projet : Conception d'une Base de Données - Plateforme Esport

Règles métier
Voici les règles régissant le fonctionnement de la plateforme:

1. Un joueur est identifié par un pseudonyme unique et une adresse email valide.
2. Un joueur peut parrainer un autre joueur ; le parrain doit être inscrit avant le filleul (relation récursive).
3. Une équipe est composée d'au moins un joueur (le capitaine) et peut en posséder plusieurs.
4. Un joueur peut appartenir à plusieurs équipes, mais ne peut représenter qu'une seule équipe par tournoi.
5. Un tournoi est organisé pour un seul jeu vidéo spécifique.
6. Un tournoi possède une date de début qui doit être strictement antérieure à sa date de fin.
7. Un tournoi peut être "ouvert" (inscription libre) ou "sur invitation".
8. Chaque tournoi définit un nombre maximum d'équipes participantes.
9. Un match oppose exactement deux équipes dans le cadre d'un tournoi (association n-aire).
10. Un match doit avoir un score pour chaque équipe et une durée enregistrée.
11. Un jeu peut avoir plusieurs éditions (ex: Standard, Deluxe, GOTY), chaque édition ayant son propre prix.
12. Les statistiques d'un joueur sont mises à jour après chaque match validé.
13. Un tournoi se déroule dans un lieu physique ou est marqué comme "Online".
14. Les récompenses (Cashprize) d'un tournoi sont réparties entre les trois premières équipes.
15. Un historique des connexions est conservé pour chaque joueur (entité faible).

Dictionnaire de données
Ce dictionnaire contient 30 données brutes.

| Nom de la donnée | Thème | Description | Type | Contraintes |
| :--- | :--- | :--- | :--- | :--- |
| `id_joueur` | Joueur | Identifiant unique du joueur | Entier | Clé primaire |
| `pseudo_joueur` | Joueur | Nom d'utilisateur unique | Texte | Unique |
| `email_joueur` | Joueur | Adresse de contact | Texte | Format email |
| `date_inscription`| Joueur | Date de création du compte | Date | Non nul |
| `id_parrain` | Joueur | ID du joueur ayant parrainé | Entier | Optionnel |
| `id_equipe` | Équipe | Identifiant unique de l'équipe | Entier | Clé primaire |
| `nom_equipe` | Équipe | Nom officiel de la structure | Texte | Unique |
| `date_creation_eq`| Équipe | Date de fondation | Date | Non nul |
| `id_jeu` | Jeu | Identifiant unique du jeu | Entier | Clé primaire |
| `titre_jeu` | Jeu | Nom du jeu vidéo | Texte | Non nul |
| `editeur_jeu` | Jeu | Entreprise créatrice | Texte | Non nul |
| `genre_jeu` | Jeu | Catégorie (FPS, MOBA...) | Texte | Non nul |
| `id_edition` | Édition | Identifiant de la version | Entier | Clé primaire |
| `nom_edition` | Édition | Ex: Standard, Gold | Texte | Non nul |
| `prix_edition` | Édition | Prix de vente | Décimal | Min 0 |
| `id_tournoi` | Tournoi | Identifiant unique du tournoi | Entier | Clé primaire |
| `nom_tournoi` | Tournoi | Nom de la compétition | Texte | Non nul |
| `date_debut_tr` | Tournoi | Date de lancement | Date | < Fin |
| `date_fin_tr` | Tournoi | Date de clôture | Date | > Début |
| `cashprize_total` | Tournoi | Montant global des prix | Décimal | Min 0 |
| `nb_max_equipes` | Tournoi | Limite de participants | Entier | Min 2 |
| `statut_tournoi` | Tournoi | Ouvert, Fermé, Terminé | Texte | Liste fermée |
| `id_match` | Match | Identifiant de la rencontre | Entier | Clé primaire |
| `score_eq1` | Match | Points équipe 1 | Entier | Min 0 |
| `score_eq2` | Match | Points équipe 2 | Entier | Min 0 |
| `duree_match` | Match | Durée en minutes | Entier | Min 1 |
| `id_log` | Historique| Identifiant de connexion | Entier | Clé primaire |
| `adresse_ip` | Historique| IP de l'utilisateur | Texte | Format IP |
| `date_connexion` | Historique| Horodatage précis | Date/Heure | Non nul |
| `os_client` | Historique| Système d'exploitation (Windows, Mac)| Texte | - |
