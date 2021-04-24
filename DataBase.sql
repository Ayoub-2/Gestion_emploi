create table Niveau(
	ID  number(2),
	nom varchar(30),
	constraint PK_NIV primary key(ID) 
);

create table Etudiant(
	ID  		number(5),
	nom 		varchar(30),
	prenom		varchar(30),
	email 		varchar(50),
	genre 		char(10),
	adresse 	varchar(70),
	ID_niv		number(2),
	constraint PK_ETUD primary key(ID),
	constraint FK_NIV foreign key(ID_niv) references Niveau(ID)
);

create table Formation(
	ID  number(5),
	nom varchar(30),
	constraint PK_FORM primary key(ID) 
);

create table Inscription(
	ID_et  number(5),
	ID_form  number(5),
	nom varchar(30),
	constraint PK_INS primary key(ID_et, ID_form),
	constraint FK_INS_FORM foreign key(ID_form) references formation(ID),
	constraint FK_INS_ETUD foreign key(ID_et) references Etudiant(ID)
);

create table Matiere(
	ID  number(5),
	ID_PROF number(5),
	nom varchar(30),
	constraint PK_MAT primary key(ID),
	constraint FK_PROF foreign key(ID_PROF) references Professeur(ID)
);

create table Formation_Matiere(
	ID_mat  number(5),
	ID_form  number(5),
	nom varchar(30),
	constraint PK_FM primary key(ID_et, ID_form),
	constraint FK_FM_FORM foreign key(ID_form) references formation(ID),
	constraint FK_FM_MAT foreign key(ID_mat) references Matiere(ID),
);

create table Professeur(
	ID  		number(5),
	nom 		varchar(30),
	prenom		varchar(30),
	email 		varchar(50),
	type 		varchar(20),
	salaire 	Number(6,3),
	ID_grade	number(2),
	constraint PK_PROF primary key(ID),
	constraint FK_GRADE foreign key(ID_grade) references Grade(ID)
);

create table Grade(
	ID  number(2),
	nom varchar(30),
	constraint PK_GRADE primary key(ID)
);

--=======================================

create table Categorie(
	ID 					Number(3),
	Libelle 			varchar(30),
	Designation			Varchar(50),
	constraint PK_CAT primary key(ID)
);

create table rubrique(
	ID 					Number(3),
	ID_cat 				Number(2),
	Libelle 			varchar(30),
	Date_rubrique		date,
	montant 			number(10,4),
	constraint PK_RUB primary key(ID),
	constraint FK_CAT foreign key(ID_cat) references Categorie(ID)
);
create table Table_Emploi(
	ID 				Number(3),
	intitule 			varchar(30),
	Responsable			Varchar(50),
	Exercice            Date,
	ID_form             number(5),
	constraint PK_CAT primary key(ID),
	constraint FK_CAT foreign key(ID_form) references Formation(ID)
);
create table Emploi_Catgeorie(
	ID_categorie   Number(5),
	ID_emploi      Number(5),
	constraint  PK_EM_CAT primary key (ID_categorie , ID_emploi),
	constraint FK_EC_Emp foreign key(ID_emploi) references Table_Emploi(ID),
	constraint FK_EC_CAT foreign key(ID_categorie) references Categorie(ID)
);
