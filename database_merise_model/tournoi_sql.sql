#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: tbl_equipes
#------------------------------------------------------------

CREATE TABLE tbl_equipes(
        numero             int (11) Auto_increment  NOT NULL ,
        nom_equipe         Varchar (25) NOT NULL ,
        nom_resp           Varchar (40) NOT NULL ,
        prenom_resp        Varchar (25) ,
        tel                Varchar (16) ,
        mobile             Varchar (16) ,
        email_resp         Varchar (60) NOT NULL ,
        num_tbl_groupes Int NOT NULL ,
        PRIMARY KEY (numero )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_groupes
#------------------------------------------------------------

CREATE TABLE tbl_groupes(
        numero              int (11) Auto_increment  NOT NULL ,
        libelle             Varchar (25) NOT NULL ,
        num_tbl_tournois Int NOT NULL ,
        PRIMARY KEY (numero )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_tournois
#------------------------------------------------------------

CREATE TABLE tbl_tournois(
        numero                   int (11) Auto_increment  NOT NULL ,
        nom_tournoi              Varchar (40) NOT NULL ,
        date_debut               Datetime NOT NULL ,
        date_fin                 Datetime ,
        num_tbl_users         Int NOT NULL ,
        num_tbl_configuration Int NOT NULL ,
        PRIMARY KEY (numero )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_users
#------------------------------------------------------------

CREATE TABLE tbl_users(
        numero   int (11) Auto_increment  NOT NULL ,
        email    Varchar (60) NOT NULL ,
        password Varchar (255) NOT NULL ,
        nom_user Varchar (50) ,
        PRIMARY KEY (numero ) ,
        UNIQUE (email )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_configuration
#------------------------------------------------------------

CREATE TABLE tbl_configuration(
        numero                  int (11) Auto_increment  NOT NULL ,
        points_victoire         Int NOT NULL ,
        sets_a_la_place_de_buts Int NOT NULL ,
		duree_match             Int NOT NULL ,
        aller_retour            Int NOT NULL ,
        PRIMARY KEY (numero )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_set_but
#------------------------------------------------------------

CREATE TABLE tbl_set_but(
        numero             int (11) Auto_increment  NOT NULL ,
        nb_pts_du_set      Int ,
        num_tbl_matchs  Int NOT NULL ,
        num_tbl_equipes Int NOT NULL ,
        PRIMARY KEY (numero )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_matchs
#------------------------------------------------------------

CREATE TABLE tbl_matchs(
        numero               int (11) Auto_increment  NOT NULL ,
        date_heure           Datetime NOT NULL ,
        num_tbl_equipes_arbitre  Int ,
        num_tbl_equipes_home Int NOT NULL ,
        num_tbl_equipes_visiteur Int NOT NULL ,
        num_tbl_terrains  Int NOT NULL ,
        PRIMARY KEY (numero )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_terrains
#------------------------------------------------------------

CREATE TABLE tbl_terrains(
        numero              int (11) Auto_increment  NOT NULL ,
        libelle             Varchar (25) NOT NULL ,
        num_tbl_tournois Int NOT NULL ,
        PRIMARY KEY (numero )
)ENGINE=InnoDB;

ALTER TABLE tbl_equipes ADD CONSTRAINT FK_tbl_equipes_num_tbl_groupes FOREIGN KEY (num_tbl_groupes) REFERENCES tbl_groupes(numero);
ALTER TABLE tbl_groupes ADD CONSTRAINT FK_tbl_groupes_num_tbl_tournois FOREIGN KEY (num_tbl_tournois) REFERENCES tbl_tournois(numero);
ALTER TABLE tbl_tournois ADD CONSTRAINT FK_tbl_tournois_num_tbl_users FOREIGN KEY (num_tbl_users) REFERENCES tbl_users(numero);
ALTER TABLE tbl_tournois ADD CONSTRAINT FK_tbl_tournois_num_tbl_configuration FOREIGN KEY (num_tbl_configuration) REFERENCES tbl_configuration(numero);
ALTER TABLE tbl_set_but ADD CONSTRAINT FK_tbl_set_but_num_tbl_matchs FOREIGN KEY (num_tbl_matchs) REFERENCES tbl_matchs(numero);
ALTER TABLE tbl_set_but ADD CONSTRAINT FK_tbl_set_but_num_tbl_equipes FOREIGN KEY (num_tbl_equipes) REFERENCES tbl_equipes(numero);
ALTER TABLE tbl_matchs ADD CONSTRAINT FK_tbl_matchs_num_tbl_equipes_arbitre FOREIGN KEY (num_tbl_equipes_arbitre) REFERENCES tbl_equipes(numero);
ALTER TABLE tbl_matchs ADD CONSTRAINT FK_tbl_matchs_num_tbl_equipes_home FOREIGN KEY (num_tbl_equipes_home) REFERENCES tbl_equipes(numero);
ALTER TABLE tbl_matchs ADD CONSTRAINT FK_tbl_matchs_num_tbl_equipes_visiteur FOREIGN KEY (num_tbl_equipes_visiteur) REFERENCES tbl_equipes(numero);
ALTER TABLE tbl_matchs ADD CONSTRAINT FK_tbl_matchs_num_tbl_terrains FOREIGN KEY (num_tbl_terrains) REFERENCES tbl_terrains(numero);
ALTER TABLE tbl_terrains ADD CONSTRAINT FK_tbl_terrains_num_tbl_tournois FOREIGN KEY (num_tbl_tournois) REFERENCES tbl_tournois(numero);
