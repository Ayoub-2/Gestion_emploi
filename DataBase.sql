create table Etudiant(
	ID  		number(5),
	ID_niv		number(2),
	nom 		varchar(30),
	prenom		varchar(30),
	email 		varchar(50),
	genre 		char(10),
	adresse 	varchar(70),
	constraint PK_ETUD primary key(ID),
	constraint FK_ETUD_NIV foreign key(ID_niv) references Niveau(ID)
);

create table Formation(
	ID  number(5),
	nom varchar(30),
	constraint PK_FORM primary key(ID) 
);

create table paiement(
	ID number(5),
	montantVerse number(5,3),
	recu VARCHAR(512) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL,
	observation varchar(200) 
);

create table Inscription(
	ID_et  number(5),
	ID_form  number(5),
	ID_paiement  number(5),
	fraisFormation number(5,3),
	anneeUniversitaire Date,
	niveau varchar(20),
	constraint PK_INS primary key(ID_et, ID_form, ID_paiement),
	constraint FK_INS_FORM foreign key(ID_form) references formation(ID),
	constraint FK_INS_ETUD foreign key(ID_et) references Etudiant(ID)
	constraint FK_INS_PAIEMENT foreign key(ID_paiment) references Paiement(ID)
);

create table Element(
	ID  number(5),
	ID_ENS number(5),
	ID_MODULE number(5),
	nom varchar(30),
	constraint PK_ELEM primary key(ID),
	constraint FK_ELEM_ENS foreign key(ID_ENS) references Enseignant(ID),
	constraint FK_ELEM_MOD foreign key(ID_MODULE) references Module(ID)
);

create table Vacation(  --contraintes et MLD
	ID   number(5), 
	taux 	number(2,3),
	taxImpotRevenu number(2,3),
	jour Date,
	montant number(5,3),
	montantBrutArrandi number(5,3),
	IR number(2,3),
	IR_arrandi number(2,3),
	net number(5,3)
);

create table Module(
	ID  number(5),
	ID_FORM number(5),
	nom varchar(30),
	constraint PK_MOD primary key(ID),
	constraint FK_MOD_FORM foreign key(ID_FORM) references Formation(ID)
);

create table Enseignant(
	ID  		number(5),
	ID_grade	number(2),
	ID_Dep	number(2),
	nom 		varchar(30),
	prenom		varchar(30),
	email 		varchar(50),
	type 		varchar(20),
	salaire 	Number(6,3),
	constraint PK_ENS primary key(ID),
	constraint FK_ENS_GRADE foreign key(ID_grade) references Grade(ID),
	constraint FK_ENS_DEP foreign key(ID_Dep) references Departement(ID)
);

create table Departement(
	ID  number(2),
	nom varchar(30),
	constraint PK_GRADE primary key(ID)
);

create table Grade(
	ID  number(2),
	nom varchar(30),
	constraint PK_GRADE primary key(ID)
);

--=======================================

create table Rubrique(
	ID 					Number(3),
	ID_PEmp 			Number(2),
	Libelle 			varchar(30),
	Date_rubrique		date,
	montant 			number(10,4),
	constraint PK_RUB primary key(ID),
	constraint FK_RUB_PEmp foreign key(ID_PEmp) references ProgrammeEmp(ID)
);

create table ProgrammeEmp(
	ID 					Number(3),
	Intitule			varchar(50),
	Responsable			varchar(30),
	Exercice			date,
	constraint PK_RUB primary key(ID),
);
