INSERT INTO JOUEUR (id_joueur, pseudo_joueur, email_joueur, date_inscription, id_parrain) VALUES
(1,  'ShadowX',    'shadowx@gmail.com',      '2022-01-10', NULL),
(2,  'NightWolf',  'nightwolf@yahoo.com',    '2022-02-14', 1),
(3,  'BlazeFire',  'blazefire@hotmail.com',  '2022-03-05', 1),
(4,  'IceStorm',   'icestorm@gmail.com',     '2022-04-20', 2),
(5,  'ThunderK',   'thunderk@gmail.com',     '2022-05-11', 2),
(6,  'ViperZero',  'viperzero@outlook.com',  '2022-06-01', 3),
(7,  'PixelAce',   'pixelace@gmail.com',     '2022-07-22', 3),
(8,  'DarkMatter', 'darkmatter@gmail.com',   '2022-08-09', 4),
(9,  'StarDust',   'stardust@yahoo.com',     '2022-09-17', 4),
(10, 'CyberHawk',  'cyberhawk@gmail.com',    '2022-10-03', 5),
(11, 'GhostByte',  'ghostbyte@gmail.com',    '2022-11-28', 5),
(12, 'NeonRush',   'neonrush@outlook.com',   '2022-12-15', 6),
(13, 'ArcLight',   'arclight@gmail.com',     '2023-01-07', 6),
(14, 'FrostBite',  'frostbite@gmail.com',    '2023-02-19', 7),
(15, 'LavaKing',   'lavaking@hotmail.com',   '2023-03-30', 7),
(16, 'SonicBlast', 'sonicblast@gmail.com',   '2023-04-14', 8),
(17, 'TurboFox',   'turbofox@yahoo.com',     '2023-05-05', 8),
(18, 'RazorEdge',  'razoredge@gmail.com',    '2023-06-21', 9),
(19, 'OmegaZero',  'omegazero@gmail.com',    '2023-07-12', 10),
(20, 'AlphaCore',  'alphacore@outlook.com',  '2023-08-01', 10);

INSERT INTO HISTORIQUE_CONNEXION (id_log, id_joueur, adresse_ip, date_connexion, os_client) VALUES
(1,  1,  '192.168.1.10', '2024-01-05 10:23:00', 'Windows'),
(2,  1,  '192.168.1.10', '2024-02-10 14:00:00', 'Windows'),
(3,  1,  '10.0.0.1',     '2024-03-01 09:15:00', 'Windows'),
(1,  2,  '172.16.0.5',   '2024-01-08 11:00:00', 'Mac'),
(2,  2,  '172.16.0.5',   '2024-02-20 16:30:00', 'Mac'),
(1,  3,  '192.168.2.20', '2024-01-15 08:45:00', 'Linux'),
(2,  3,  '192.168.2.20', '2024-03-10 12:00:00', 'Linux'),
(1,  4,  '10.10.1.1',    '2024-01-20 19:00:00', 'Windows'),
(2,  4,  '10.10.1.1',    '2024-04-05 21:30:00', 'Windows'),
(1,  5,  '192.168.5.5',  '2024-02-01 07:00:00', 'Mac'),
(1,  6,  '172.20.0.8',   '2024-02-14 18:00:00', 'Windows'),
(1,  7,  '192.168.7.1',  '2024-02-28 22:00:00', 'Windows'),
(1,  8,  '10.0.1.50',    '2024-03-05 13:00:00', 'Mac'),
(1,  9,  '192.168.9.9',  '2024-03-18 15:45:00', 'Linux'),
(1,  10, '172.16.1.1',   '2024-04-01 10:00:00', 'Windows');

INSERT INTO JEU (id_jeu, titre_jeu, editeur_jeu, genre_jeu) VALUES
(1, 'League of Legends', 'Riot Games',      'MOBA'),
(2, 'Counter-Strike 2',  'Valve',           'FPS'),
(3, 'Valorant',          'Riot Games',      'FPS'),
(4, 'Dota 2',            'Valve',           'MOBA'),
(5, 'Rocket League',     'Psyonix',         'Sport');

INSERT INTO EDITION (id_edition, nom_edition, prix_edition, id_jeu) VALUES
(1,  'Standard',        0.00,   1),
(2,  'Riot Pass',       9.99,   1),
(3,  'Standard',        0.00,   2),
(4,  'Prime Status',    14.99,  2),
(5,  'Standard',        0.00,   3),
(6,  'Premium Battle',  9.99,   3),
(7,  'Deluxe',          19.99,  3),
(8,  'Standard',        0.00,   4),
(9,  'Compendium',      9.99,   4),
(10, 'Standard',        19.99,  5),
(11, 'Rocket Pass',     9.99,   5);

INSERT INTO EQUIPE (id_equipe, nom_equipe, date_creation_eq, id_capitaine) VALUES
(1, 'Team Alpha',    '2022-01-15', 1),
(2, 'Nova Esport',   '2022-03-10', 4),
(3, 'Shadow Wolves', '2022-06-05', 7),
(4, 'Blaze Squad',   '2022-08-20', 10),
(5, 'Iron Forge',    '2023-01-10', 13),
(6, 'Cyber Knights', '2023-03-15', 15),
(7, 'Storm Riders',  '2023-05-01', 17),
(8, 'Pixel Warriors','2023-07-20', 19);

INSERT INTO APPARTENIR (id_joueur, id_equipe, date_entree) VALUES
(1,  1, '2022-01-15'),
(2,  1, '2022-01-20'),
(3,  1, '2022-02-01'),
(4,  2, '2022-03-10'),
(5,  2, '2022-03-15'),
(6,  2, '2022-04-01'),
(7,  3, '2022-06-05'),
(8,  3, '2022-06-10'),
(9,  3, '2022-07-01'),
(10, 4, '2022-08-20'),
(11, 4, '2022-08-25'),
(12, 4, '2022-09-01'),
(13, 5, '2023-01-10'),
(14, 5, '2023-01-15'),
(15, 6, '2023-03-15'),
(16, 6, '2023-03-20'),
(17, 7, '2023-05-01'),
(18, 7, '2023-05-10'),
(19, 8, '2023-07-20'),
(20, 8, '2023-07-25'),
(1,  2, '2023-01-01'),
(5,  3, '2023-02-01');

INSERT INTO TOURNOI (id_tournoi, nom_tournoi, date_debut_tr, date_fin_tr, cashprize_total, nb_max_equipes, statut_tournoi, type_tournoi, lieu_tournoi, id_jeu) VALUES
(1, 'Spring Cup 2023',      '2023-03-01', '2023-03-15', 10000.00, 8,  'Terminé',  'Ouvert',         'Online',      1),
(2, 'Paris FPS Open',       '2023-04-10', '2023-04-20', 25000.00, 16, 'Terminé',  'Ouvert',         'Paris, France', 2),
(3, 'Valorant Invitational','2023-06-05', '2023-06-10', 15000.00, 8,  'Terminé',  'Sur invitation', 'Online',      3),
(4, 'Dota Winter League',   '2023-11-01', '2023-11-30', 50000.00, 16, 'Terminé',  'Sur invitation', 'Lyon, France',  4),
(5, 'Summer Brawl',         '2024-07-01', '2024-07-14', 5000.00,  8,  'Terminé',  'Ouvert',         'Online',      5),
(6, 'LoL Autumn Series',    '2024-09-01', '2024-09-21', 20000.00, 8,  'Terminé',  'Ouvert',         'Bordeaux, France', 1),
(7, 'CS2 Pro League',       '2025-01-10', '2025-01-25', 30000.00, 8,  'Terminé',  'Sur invitation', 'Online',      2),
(8, 'Valorant Spring 2025', '2025-04-01', '2025-04-20', 12000.00, 8,  'Ouvert',   'Ouvert',         'Online',      3);

INSERT INTO RECOMPENSE (id_tournoi, classement, montant) VALUES
(1, 1, 6000.00), (1, 2, 2500.00), (1, 3, 1500.00),
(2, 1,15000.00), (2, 2, 7000.00), (2, 3, 3000.00),
(3, 1, 9000.00), (3, 2, 4000.00), (3, 3, 2000.00),
(4, 1,30000.00), (4, 2,13000.00), (4, 3, 7000.00),
(5, 1, 3000.00), (5, 2, 1500.00), (5, 3,  500.00),
(6, 1,12000.00), (6, 2, 5500.00), (6, 3, 2500.00),
(7, 1,18000.00), (7, 2, 8000.00), (7, 3, 4000.00),
(8, 1, 7000.00), (8, 2, 3000.00), (8, 3, 2000.00);

INSERT INTO PARTICIPER (id_equipe, id_tournoi) VALUES
(1, 1), (2, 1), (3, 1), (4, 1),
(1, 2), (2, 2), (3, 2), (4, 2),
(5, 2), (6, 2),
(1, 3), (3, 3), (5, 3), (6, 3),
(2, 4), (4, 4), (7, 4), (8, 4),
(1, 5), (2, 5), (7, 5), (8, 5),
(1, 6), (3, 6), (5, 6), (6, 6),
(2, 7), (4, 7), (7, 7), (8, 7),
(1, 8), (2, 8), (3, 8), (4, 8);

INSERT INTO AFFRONTEMENT (id_match, score_eq1, score_eq2, duree_match, id_tournoi, id_equipe1, id_equipe2) VALUES
(1,  2, 0, 45, 1, 1, 2),
(2,  1, 2, 52, 1, 3, 4),
(3,  2, 1, 38, 1, 1, 3),
(4, 16, 9, 42, 2, 1, 5),
(5, 13,16, 55, 2, 2, 3),
(6, 16,11, 37, 2, 1, 6),
(7,  2, 0, 33, 3, 1, 5),
(8,  0, 2, 40, 3, 3, 6),
(9,  2, 1, 48, 3, 1, 6),
(10, 3, 1, 95, 4, 2, 4),
(11, 1, 3, 88, 4, 7, 8),
(12, 3, 2,102, 4, 2, 8),
(13, 3, 1, 12, 5, 1, 2),
(14, 2, 3, 14, 5, 7, 8),
(15, 3, 2, 11, 5, 1, 7);

INSERT INTO STATISTIQUE_JOUEUR (id_joueur, id_match, kills, deaths, assists, score_individuel) VALUES
-- Match 1
(1,  1, 8,  3, 5, 1250),
(2,  1, 5,  6, 7, 980),
(3,  1, 4,  5, 3, 750),
-- Match 2
(4,  2, 7,  4, 6, 1100),
(5,  2, 3,  7, 2, 620),
(7,  2, 9,  2, 4, 1400),
-- Match 3
(1,  3, 11, 1, 8, 1800),
(2,  3, 6,  4, 5, 1050),
(8,  3, 4,  9, 1, 560),
-- Match 4
(1,  4, 25, 8, 12, 3200),
(3,  4, 18, 10, 9, 2400),
(13, 4, 22, 7, 15, 3100),
-- Match 5
(4,  5, 14, 12, 8, 1900),
(6,  5, 20, 6, 11, 2700),
(7,  5, 16, 9, 10, 2200);
