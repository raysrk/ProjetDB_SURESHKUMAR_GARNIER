SELECT pseudo_joueur, email_joueur, date_inscription
FROM JOUEUR
WHERE date_inscription BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY date_inscription ASC;

SELECT nom_tournoi, cashprize_total, statut_tournoi, lieu_tournoi
FROM TOURNOI
WHERE cashprize_total BETWEEN 10000 AND 30000
ORDER BY cashprize_total DESC;

SELECT DISTINCT pseudo_joueur, date_inscription
FROM JOUEUR
WHERE pseudo_joueur LIKE 'A%'
   OR pseudo_joueur LIKE 'B%'
   OR pseudo_joueur LIKE 'C%'
   OR pseudo_joueur LIKE 'D%'
   OR pseudo_joueur LIKE 'E%'
   OR pseudo_joueur LIKE 'F%'
ORDER BY pseudo_joueur;

SELECT T.nom_tournoi, J.titre_jeu, J.genre_jeu, T.cashprize_total
FROM TOURNOI T
JOIN JEU J ON T.id_jeu = J.id_jeu
WHERE J.genre_jeu IN ('FPS', 'MOBA')
ORDER BY T.cashprize_total DESC;

SELECT E.nom_equipe, E.date_creation_eq, J.pseudo_joueur AS capitaine
FROM EQUIPE E
JOIN JOUEUR J ON E.id_capitaine = J.id_joueur
WHERE E.date_creation_eq < '2023-01-01'
ORDER BY E.date_creation_eq ASC;

SELECT nom_tournoi, lieu_tournoi, date_debut_tr, date_fin_tr
FROM TOURNOI
WHERE lieu_tournoi NOT LIKE 'Online'
ORDER BY date_debut_tr;

SELECT DISTINCT J.pseudo_joueur
FROM JOUEUR J
JOIN APPARTENIR A ON J.id_joueur = A.id_joueur
WHERE A.id_equipe = 1;

SELECT J.titre_jeu, COUNT(T.id_tournoi) AS nb_tournois,
       SUM(T.cashprize_total) AS total_prize_pool
FROM JEU J
JOIN TOURNOI T ON J.id_jeu = T.id_jeu
GROUP BY J.id_jeu, J.titre_jeu
ORDER BY total_prize_pool DESC;

SELECT J.pseudo_joueur,
       COUNT(S.id_match)           AS nb_matchs_joues,
       AVG(S.score_individuel)     AS score_moyen,
       SUM(S.kills)                AS total_kills,
       SUM(S.deaths)               AS total_deaths
FROM JOUEUR J
JOIN STATISTIQUE_JOUEUR S ON J.id_joueur = S.id_joueur
GROUP BY J.id_joueur, J.pseudo_joueur
ORDER BY score_moyen DESC;

SELECT J.pseudo_joueur, COUNT(S.id_match) AS nb_matchs
FROM JOUEUR J
JOIN STATISTIQUE_JOUEUR S ON J.id_joueur = S.id_joueur
GROUP BY J.id_joueur, J.pseudo_joueur
HAVING nb_matchs > 1
ORDER BY nb_matchs DESC;

SELECT T.nom_tournoi,
       COUNT(M.id_match)       AS nb_matchs,
       AVG(M.duree_match)      AS duree_moyenne,
       MIN(M.duree_match)      AS duree_min,
       MAX(M.duree_match)      AS duree_max
FROM TOURNOI T
JOIN MATCH_ESPORT M ON T.id_tournoi = M.id_tournoi
GROUP BY T.id_tournoi, T.nom_tournoi
ORDER BY duree_moyenne DESC;

SELECT T.nom_tournoi,
       T.cashprize_total,
       COUNT(P.id_equipe) AS nb_equipes,
       T.cashprize_total / COUNT(P.id_equipe) AS prize_par_equipe
FROM TOURNOI T
JOIN PARTICIPER P ON T.id_tournoi = P.id_tournoi
GROUP BY T.id_tournoi, T.nom_tournoi, T.cashprize_total
HAVING prize_par_equipe > 3000
ORDER BY prize_par_equipe DESC;

SELECT J.pseudo_joueur AS parrain,
       COUNT(F.id_joueur) AS nb_filleuls
FROM JOUEUR J
JOIN JOUEUR F ON J.id_joueur = F.id_parrain
GROUP BY J.id_joueur, J.pseudo_joueur
ORDER BY nb_filleuls DESC;

SELECT M.id_match,
       T.nom_tournoi,
       E1.nom_equipe  AS equipe1,
       M.score_eq1,
       M.score_eq2,
       E2.nom_equipe  AS equipe2,
       M.duree_match
FROM MATCH_ESPORT M
JOIN TOURNOI T  ON M.id_tournoi  = T.id_tournoi
JOIN EQUIPE E1  ON M.id_equipe1  = E1.id_equipe
JOIN EQUIPE E2  ON M.id_equipe2  = E2.id_equipe
ORDER BY T.nom_tournoi, M.id_match;

SELECT J.titre_jeu, J.genre_jeu,
       COUNT(T.id_tournoi) AS nb_tournois
FROM JEU J
LEFT JOIN TOURNOI T ON J.id_jeu = T.id_jeu
GROUP BY J.id_jeu, J.titre_jeu, J.genre_jeu
ORDER BY nb_tournois DESC;

SELECT J.pseudo_joueur, J.date_inscription
FROM JOUEUR J
LEFT JOIN STATISTIQUE_JOUEUR S ON J.id_joueur = S.id_joueur
WHERE S.id_joueur IS NULL
ORDER BY J.date_inscription;

SELECT J.pseudo_joueur,
       T.nom_tournoi,
       M.id_match,
       S.kills, S.deaths, S.assists, S.score_individuel
FROM STATISTIQUE_JOUEUR S
JOIN JOUEUR J           ON S.id_joueur   = J.id_joueur
JOIN MATCH_ESPORT M     ON S.id_match    = M.id_match
JOIN TOURNOI T          ON M.id_tournoi  = T.id_tournoi
JOIN APPARTENIR A       ON J.id_joueur   = A.id_joueur
WHERE A.id_equipe = 1
ORDER BY T.nom_tournoi, J.pseudo_joueur;

SELECT T.nom_tournoi, R.classement,
       CONCAT(R.montant, ' €') AS prix
FROM RECOMPENSE R
JOIN TOURNOI T ON R.id_tournoi = T.id_tournoi
ORDER BY T.nom_tournoi, R.classement;

SELECT F.pseudo_joueur   AS filleul,
       P.pseudo_joueur   AS parrain,
       E.nom_equipe
FROM JOUEUR F
LEFT JOIN JOUEUR P      ON F.id_parrain   = P.id_joueur
JOIN APPARTENIR A       ON F.id_joueur    = A.id_joueur
JOIN EQUIPE E           ON A.id_equipe    = E.id_equipe
ORDER BY E.nom_equipe, F.pseudo_joueur;

SELECT pseudo_joueur, date_inscription
FROM JOUEUR
WHERE id_joueur IN (
    SELECT id_joueur FROM APPARTENIR
    WHERE id_equipe IN (
        SELECT id_equipe FROM PARTICIPER
        WHERE id_tournoi = 1
    )
)
ORDER BY pseudo_joueur;

SELECT nom_equipe
FROM EQUIPE
WHERE id_equipe NOT IN (
    SELECT P.id_equipe
    FROM PARTICIPER P
    JOIN TOURNOI T ON P.id_tournoi = T.id_tournoi
    WHERE T.type_tournoi = 'Sur invitation'
);

SELECT nom_tournoi, cashprize_total, statut_tournoi
FROM TOURNOI T
WHERE EXISTS (
    SELECT 1 FROM MATCH_ESPORT M
    WHERE M.id_tournoi = T.id_tournoi
);

SELECT pseudo_joueur, email_joueur, date_inscription
FROM JOUEUR J
WHERE NOT EXISTS (
    SELECT 1 FROM HISTORIQUE_CONNEXION H
    WHERE H.id_joueur = J.id_joueur
);

SELECT DISTINCT J.pseudo_joueur, S.score_individuel
FROM JOUEUR J
JOIN STATISTIQUE_JOUEUR S ON J.id_joueur = S.id_joueur
WHERE J.id_joueur NOT IN (SELECT id_joueur FROM APPARTENIR WHERE id_equipe = 1)
  AND S.score_individuel > ANY (
    SELECT S2.score_individuel
    FROM STATISTIQUE_JOUEUR S2
    JOIN APPARTENIR A ON S2.id_joueur = A.id_joueur
    WHERE A.id_equipe = 1
)
ORDER BY S.score_individuel DESC;

SELECT nom_tournoi, lieu_tournoi, cashprize_total
FROM TOURNOI
WHERE lieu_tournoi <> 'Online'
  AND cashprize_total > ALL (
    SELECT cashprize_total FROM TOURNOI
    WHERE lieu_tournoi = 'Online'
)
ORDER BY cashprize_total DESC;
