create table Niveau(
	ID  SMALLINT,
	nom varchar(30),
	constraint PK_NIV primary key(ID)
);
create table paiement(
	ID 				SMALLINT,
	montantVerse 	DECIMAL(5,3),
	recu 			VARCHAR(512) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL,
	observation 	varchar(200),
	constraint PK_PAIEMENT primary key(ID)
);

create table Departement(
	ID  SMALLINT,
	nom varchar(30),
	constraint PK_GRADE primary key(ID)
);

create table Grade(
	ID  SMALLINT,
	nom varchar(30),
	constraint PK_GRADE primary key(ID)
);
create table formation (
	ID                SMALLINT6,
	NOM               Varchar(30),
	constraint PK_FORM primary key(ID)
)
create table Vacation(
	ID   				SMALLINT,
	ID_ENS 				SMALLINT,
	taux 				DECIMAL(3,3),
	taxImpotRevenu 		DECIMAL(3,3),
	jour 				Date,
	montant 			DECIMAL(5,3),
	montantBrutArrandi 	DECIMAL(5,3),
	IR 					DECIMAL(3,3),
	IR_arrandi 			DECIMAL(3,3),
	net 				DECIMAL(5,3),
	constraint PK_VAC primary key(ID)
);


create table Etudiant(
	ID  		SMALLINT,
	ID_niv 		SMALLINT,
	nom 		varchar(30),
	prenom 		varchar(30),
	email 		varchar(50),
	genre  		char(10),
	adresse 	varchar(70),
	constraint PK_ETUD primary key(ID),
	constraint FK_ETUD_NIV foreign key(ID_niv) references Niveau(ID)
);



create table Inscription(
	ID_et  				SMALLINT,
	ID_form  			SMALLINT,
	ID_paiement  		SMALLINT,
	fraisFormation 		DECIMAL(5,3),
	anneeUniversitaire 	Date,
	Niveau 				varchar(20),
	constraint PK_INS primary key(ID_et, ID_form, ID_paiement),
	constraint FK_INS_FORM foreign key(ID_form) references formation(ID),
	constraint FK_INS_ETUD foreign key(ID_et) references Etudiant(ID),
	constraint FK_INS_PAIEMENT foreign key(ID_paiement) references Paiement(ID)
);

create table Enseignant(
	ID  		SMALLINT,
	ID_grade 	SMALLINT,
	ID_Dep 		SMALLINT,
	ID_vac 		SMALLINT,
	nom 		varchar(30),
	prenom 		varchar(30),
	email  		varchar(50),
	type  		varchar(20),
	salaire  	DECIMAL(6,3),
	constraint PK_ENS primary key(ID),
	constraint FK_ENS_GRADE foreign key(ID_grade) references Grade(ID),
	constraint FK_ENS_DEP foreign key(ID_Dep) references Departement(ID)
);

create table Module(
	ID  		SMALLINT,
	ID_FORM 	SMALLINT,
	nom 		varchar(30),
	constraint PK_MOD primary key(ID),
	constraint FK_MOD_FORM foreign key(ID_FORM) references Formation(ID)
);
create table Element(
	ID  		SMALLINT,
	ID_ENS 		SMALLINT,
	ID_MODULE 	SMALLINT,
	nom 		varchar(30),
	constraint PK_ELEM primary key(ID),
	constraint FK_ELEM_ENS foreign key(ID_ENS) references Enseignant(ID),
	constraint FK_ELEM_MOD foreign key(ID_MODULE) references Module(ID)
);

ALTER TABLE Vacation
ADD CONSTRAINT FK_VAC_ENS foreign key(ID_ENS) references Enseignant(ID);
alter table Enseignant
ADD constraint FK_ENS_VAC foreign key(ID_vac) references Vacation(ID);

--  =======================================

create table ProgrammeEmp(
	ID 					SMALLINT,
	Intitule 			varchar(50),
	Responsable 		varchar(30),
	Exercice 			date,
	constraint PK_RUB primary key(ID)
);
 
create table Rubrique(
	ID 					SMALLINT,
	ID_PEmp 			SMALLINT,
	Libelle 			varchar(30),
	Date_rubrique 		date,
	montant 			DECIMAL(10,4),
	constraint PK_RUB primary key(ID),
	constraint FK_RUB_PEmp foreign key(ID_PEmp) references ProgrammeEmp(ID)
);
