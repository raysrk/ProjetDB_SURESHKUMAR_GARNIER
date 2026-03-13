DROP TABLE IF EXISTS STATISTIQUE_JOUEUR;
DROP TABLE IF EXISTS AFFRONTEMENT;
DROP TABLE IF EXISTS RECOMPENSE;
DROP TABLE IF EXISTS PARTICIPER;
DROP TABLE IF EXISTS APPARTENIR;
DROP TABLE IF EXISTS TOURNOI;
DROP TABLE IF EXISTS EDITION;
DROP TABLE IF EXISTS JEU;
DROP TABLE IF EXISTS HISTORIQUE_CONNEXION;
DROP TABLE IF EXISTS EQUIPE;
DROP TABLE IF EXISTS JOUEUR;

CREATE TABLE JOUEUR (
    id_joueur       INT             NOT NULL AUTO_INCREMENT,
    pseudo_joueur   VARCHAR(50)     NOT NULL,
    email_joueur    VARCHAR(100)    NOT NULL,
    date_inscription DATE           NOT NULL,
    id_parrain      INT             DEFAULT NULL,

    CONSTRAINT PK_JOUEUR PRIMARY KEY (id_joueur),
    CONSTRAINT UQ_JOUEUR_PSEUDO UNIQUE (pseudo_joueur),
    CONSTRAINT UQ_JOUEUR_EMAIL  UNIQUE (email_joueur),
    CONSTRAINT FK_JOUEUR_PARRAIN FOREIGN KEY (id_parrain)
        REFERENCES JOUEUR(id_joueur)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE HISTORIQUE_CONNEXION (
    id_log          INT             NOT NULL,
    id_joueur       INT             NOT NULL,
    adresse_ip      VARCHAR(45)     NOT NULL,
    date_connexion  DATETIME        NOT NULL,
    os_client       VARCHAR(50)     DEFAULT NULL,

    CONSTRAINT PK_HISTORIQUE PRIMARY KEY (id_log, id_joueur),
    CONSTRAINT FK_HIST_JOUEUR FOREIGN KEY (id_joueur)
        REFERENCES JOUEUR(id_joueur)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE JEU (
    id_jeu      INT             NOT NULL AUTO_INCREMENT,
    titre_jeu   VARCHAR(100)    NOT NULL,
    editeur_jeu VARCHAR(100)    NOT NULL,
    genre_jeu   VARCHAR(50)     NOT NULL,

    CONSTRAINT PK_JEU PRIMARY KEY (id_jeu)
);

CREATE TABLE EDITION (
    id_edition  INT             NOT NULL AUTO_INCREMENT,
    nom_edition VARCHAR(50)     NOT NULL,
    prix_edition DECIMAL(8,2)   NOT NULL DEFAULT 0.00,
    id_jeu      INT             NOT NULL,

    CONSTRAINT PK_EDITION PRIMARY KEY (id_edition),
    CONSTRAINT FK_EDITION_JEU FOREIGN KEY (id_jeu)
        REFERENCES JEU(id_jeu)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE EQUIPE (
    id_equipe       INT             NOT NULL AUTO_INCREMENT,
    nom_equipe      VARCHAR(100)    NOT NULL,
    date_creation_eq DATE           NOT NULL,
    id_capitaine    INT             NOT NULL,

    CONSTRAINT PK_EQUIPE PRIMARY KEY (id_equipe),
    CONSTRAINT UQ_EQUIPE_NOM UNIQUE (nom_equipe),
    CONSTRAINT FK_EQUIPE_CAPITAINE FOREIGN KEY (id_capitaine)
        REFERENCES JOUEUR(id_joueur)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE APPARTENIR (
    id_joueur   INT     NOT NULL,
    id_equipe   INT     NOT NULL,
    date_entree DATE    NOT NULL,

    CONSTRAINT PK_APPARTENIR PRIMARY KEY (id_joueur, id_equipe),
    CONSTRAINT FK_APP_JOUEUR FOREIGN KEY (id_joueur)
        REFERENCES JOUEUR(id_joueur)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_APP_EQUIPE FOREIGN KEY (id_equipe)
        REFERENCES EQUIPE(id_equipe)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE TOURNOI (
    id_tournoi      INT             NOT NULL AUTO_INCREMENT,
    nom_tournoi     VARCHAR(100)    NOT NULL,
    date_debut_tr   DATE            NOT NULL,
    date_fin_tr     DATE            NOT NULL,
    cashprize_total DECIMAL(12,2)   NOT NULL DEFAULT 0.00,
    nb_max_equipes  INT             NOT NULL DEFAULT 2,
    statut_tournoi  VARCHAR(20)     NOT NULL DEFAULT 'Ouvert',
    type_tournoi    VARCHAR(20)     NOT NULL DEFAULT 'Ouvert',
    lieu_tournoi    VARCHAR(100)    NOT NULL DEFAULT 'Online',
    id_jeu          INT             NOT NULL,

    CONSTRAINT PK_TOURNOI PRIMARY KEY (id_tournoi),
    CONSTRAINT FK_TOURNOI_JEU FOREIGN KEY (id_jeu)
        REFERENCES JEU(id_jeu)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE RECOMPENSE (
    id_tournoi  INT             NOT NULL,
    classement  TINYINT         NOT NULL,
    montant     DECIMAL(12,2)   NOT NULL DEFAULT 0.00,

    CONSTRAINT PK_RECOMPENSE PRIMARY KEY (id_tournoi, classement),
    CONSTRAINT FK_RECOMP_TOURNOI FOREIGN KEY (id_tournoi)
        REFERENCES TOURNOI(id_tournoi)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PARTICIPER (
    id_equipe   INT NOT NULL,
    id_tournoi  INT NOT NULL,

    CONSTRAINT PK_PARTICIPER PRIMARY KEY (id_equipe, id_tournoi),
    CONSTRAINT FK_PART_EQUIPE FOREIGN KEY (id_equipe)
        REFERENCES EQUIPE(id_equipe)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_PART_TOURNOI FOREIGN KEY (id_tournoi)
        REFERENCES TOURNOI(id_tournoi)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE AFFRONTEMENT (
    id_match    INT     NOT NULL AUTO_INCREMENT,
    score_eq1   INT     NOT NULL DEFAULT 0,
    score_eq2   INT     NOT NULL DEFAULT 0,
    duree_match INT     NOT NULL,
    id_tournoi  INT     NOT NULL,
    id_equipe1  INT     NOT NULL,
    id_equipe2  INT     NOT NULL,

    CONSTRAINT PK_AFFRONTEMENT PRIMARY KEY (id_match),
    CONSTRAINT FK_AFFRONTEMENT_TOURNOI FOREIGN KEY (id_tournoi)
        REFERENCES TOURNOI(id_tournoi)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_AFFRONTEMENT_EQ1 FOREIGN KEY (id_equipe1)
        REFERENCES EQUIPE(id_equipe)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT FK_AFFRONTEMENT_EQ2 FOREIGN KEY (id_equipe2)
        REFERENCES EQUIPE(id_equipe)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE STATISTIQUE_JOUEUR (
    id_joueur           INT     NOT NULL,
    id_match            INT     NOT NULL,
    kills               INT     NOT NULL DEFAULT 0,
    deaths              INT     NOT NULL DEFAULT 0,
    assists             INT     NOT NULL DEFAULT 0,
    score_individuel    INT     NOT NULL DEFAULT 0,

    CONSTRAINT PK_STAT PRIMARY KEY (id_joueur, id_match),
    CONSTRAINT FK_STAT_JOUEUR FOREIGN KEY (id_joueur)
        REFERENCES JOUEUR(id_joueur)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_STAT_AFFRONTEMENT FOREIGN KEY (id_match)
        REFERENCES AFFRONTEMENT(id_match)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
