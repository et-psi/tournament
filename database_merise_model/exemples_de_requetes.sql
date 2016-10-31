#-- Matchs se d�roulant lors d'un tournoi
SELECT distinct t.libelle, t.numero, e1.nom_equipe, e2.nom_equipe, a.nom_equipe AS 'Arbitre'
FROM tbl_terrains t
INNER JOIN tbl_matchs m ON m.num_tbl_terrains = t.numero
INNER JOIN tbl_equipes e1 ON e1.numero = m.num_tbl_equipes_home
INNER JOIN tbl_equipes e2 ON e2.numero = m.num_tbl_equipes_visiteur
LEFT OUTER JOIN tbl_equipes a ON a.numero = m.num_tbl_equipes_arbitre
WHERE t.num_tbl_tournois = 1

#----- Matchs se d�roulant lors d'un tournoi pour un groupe sp�cifique
SELECT distinct t.libelle, t.numero, e1.nom_equipe, e2.nom_equipe, a.nom_equipe AS 'Arbitre'
FROM tbl_terrains t
INNER JOIN tbl_matchs m ON m.num_tbl_terrains = t.numero
INNER JOIN tbl_equipes e1 ON e1.numero = m.num_tbl_equipes_home
INNER JOIN tbl_equipes e2 ON e2.numero = m.num_tbl_equipes_visiteur
LEFT OUTER JOIN tbl_equipes a ON a.numero = m.num_tbl_equipes_arbitre
WHERE t.num_tbl_tournois = 1 AND e2.num_tbl_groupes = 1


#--------Matchs se d�roulant sur un terrain sp�cifique
SELECT distinct t.libelle, t.numero, e1.nom_equipe, e2.nom_equipe, a.nom_equipe AS 'Arbitre'
FROM tbl_terrains t
INNER JOIN tbl_matchs m ON m.num_tbl_terrains = t.numero
INNER JOIN tbl_equipes e1 ON e1.numero = m.num_tbl_equipes_home
INNER JOIN tbl_equipes e2 ON e2.numero = m.num_tbl_equipes_visiteur
LEFT OUTER JOIN tbl_equipes a ON a.numero = m.num_tbl_equipes_arbitre
WHERE t.num_tbl_tournois = 1 AND t.numero = 1


#------- Equipes d'un tournoi sp�cifique ---------
SELECT * from tbl_equipes
INNER JOIN tbl_groupes ON tbl_groupes.numero = tbl_equipes.num_tbl_groupes
INNER JOIN tbl_tournois ON tbl_tournois.numero = tbl_groupes.num_tbl_tournois
WHERE tbl_tournois.numero = 1

#------- Matchs d'une �quipe lors d'un tournoi sp�cifique ---------
SELECT * from tbl_matchs
INNER JOIN tbl_equipes ON tbl_equipes.numero = tbl_matchs.num_tbl_equipes_home
WHERE tbl_equipes.numero = 2

UNION

SELECT * from tbl_matchs
INNER JOIN tbl_equipes ON tbl_equipes.numero = tbl_matchs.num_tbl_equipes_visiteur
WHERE tbl_equipes.numero = 2

#------ Liste buts/sets marqu�s lors d'un match pour une �quipe
SELECT tbl_equipes.numero , tbl_equipes.nom_equipe, tbl_matchs.numero AS 'match' FROM tbl_equipes
INNER JOIN tbl_set_but ON tbl_set_but.num_tbl_equipes = tbl_equipes.numero
INNER JOIN tbl_matchs ON tbl_matchs.numero = tbl_set_but.num_tbl_matchs
WHERE tbl_equipes.numero = 3 AND tbl_matchs.numero = 7


#------ nombre buts/sets marqu�s lors d'un match pour une �quipe
SELECT COUNT(tbl_matchs.numero) AS 'But(s) marqu�(s) par l\�quipe 3 lors du match 7' FROM tbl_equipes
INNER JOIN tbl_set_but ON tbl_set_but.num_tbl_equipes = tbl_equipes.numero
INNER JOIN tbl_matchs ON tbl_matchs.numero = tbl_set_but.num_tbl_matchs
WHERE tbl_equipes.numero = 3 AND tbl_matchs.numero = 7

#--- nombre de buts/sets marqu�s par l'�quipe 3 lors du match num�ro 7
SELECT COUNT(b.numero)  as nbButs
FROM tbl_set_but b
WHERE b.num_tbl_equipes = 3 AND b.num_tbl_matchs = 7

#------ nombre buts/sets marqu�s d'une �quipe appartenant � un groupe
SELECT COUNT(tbl_matchs.numero) AS 'But(s) marqu�(s) par dans le groupe 1 par l\�quipe 3' FROM tbl_groupes
INNER JOIN tbl_equipes ON tbl_equipes.num_tbl_groupes = tbl_groupes.numero
INNER JOIN tbl_set_but ON tbl_set_but.num_tbl_equipes = tbl_equipes.numero
INNER JOIN tbl_matchs ON tbl_matchs.numero = tbl_set_but.num_tbl_matchs
WHERE tbl_equipes.numero = 3 AND tbl_groupes.numero = 1

#----- buts marqu�s par les �quipes d'un groupe
SELECT COUNT(tbl_set_but.numero), tbl_equipes.nom_equipe AS 'But(s) marqu�(s) par les �quipes' FROM tbl_groupes
INNER JOIN tbl_equipes ON tbl_equipes.num_tbl_groupes = tbl_groupes.numero
INNER JOIN tbl_set_but ON tbl_set_but.num_tbl_equipes = tbl_equipes.numero
WHERE tbl_groupes.numero = 1
GROUP BY tbl_equipes.nom_equipe






