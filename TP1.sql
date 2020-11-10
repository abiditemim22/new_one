
--1 ère question

CREATE TABLE PARTICIPATIONS(
idCandidat int CONSTRAINT fk_idcandidat REFERENCES CANDIDAT(CIN_candidat),
IdSession varchar (30) CONSTRAINT FK_idSession REFERENCES SESSIONS(idSession));

CREATE TABLE FORMATIONS(
NomFormation varchar(50) CONSTRAINT pk_nomformation PRIMARY KEY,
Description varchar(50),
Duree int ,
Prix float );

CREATE TABLE CANDIDAT(
CIN_candidat int CONSTRAINT pk_cin_candidat PRIMARY KEY,
NomCandidat varchar(15),
prenomCandidat varchar(15),
DateN date,
Niveau varchar(15),
Nationnalite varchar(20));

CREATE TABLE SESSIONS(
IdSession varchar (30) CONSTRAINT pk_idsession PRIMARY KEY,
DateDebutSession date,
NomFormateur varchar (30),
NomFormation varchar(50) CONSTRAINT fk_nomformation REFERENCES FORMATIONS(NomFormation));	
 


--2 ème question

ALTER TABLE SESSIONS ADD Lieu varchar(15) DEFAULT 'ORADIST' NOT NULL;

--3 ème question 
A)

ALTER TABLE FORMATIONS ALTER COLUMN Duree int NOT NULL;
ALTER TABLE FORMATIONS ALTER COLUMN Prix float NOT NULL;

B)
 
ALTER TABLE FORMATIONS ADD Constraint  uq_description UNIQUE(Description);

C)

ALTER TABLE CANDIDAT ADD Constraint ck_niveau_etudes CHECK(Niveau IN  ('BAC+2','BAC+3','BAC+4','BAC+5'));
 
D)

ALTER TABLE FORMATIONS ADD Constraint ck_duree CHECK(Duree between 2 AND 90) ;

--4 ème question

DROP TABLE CANDIDAT cascade constraints;
DROP TABLE FORMATIONS cascade constraints;
DROP TABLE SESSIONS cascade constraints;
DROP TABLE PARTICIPATIONS cascade constraints;