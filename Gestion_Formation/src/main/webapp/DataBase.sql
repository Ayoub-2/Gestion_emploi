create table Rubrique(
	ID 				INT,
	Libelle 			varchar(512),
	constraint PK_RUB primary key(ID)
);
create table Niveau(
	ID  SMALLINT,
	nom varchar(30),
	constraint PK_NIV primary key(ID)
);

create table Vacation(
	ID   				SMALLINT,
	ID_ENS 				SMALLINT,
	ID_ELEM 			SMALLINT,
	taux 				DECIMAL(9,3),
	taxImpotRevenu 			DECIMAL(9,3),
	montant 			DECIMAL(9,3),
	montantBrutArrandi 		DECIMAL(9,3),
	IR 				DECIMAL(9,3),
	IR_arrandi 			DECIMAL(9,3),
	net 				DECIMAL(9,3),
	constraint PK_VAC primary key(ID)
);



create table Departement(
	ID  SMALLINT,
	nom varchar(100),
	constraint PK_GRADE primary key(ID)
);

create table Grade(
	ID  SMALLINT,
	nom varchar(5),
	constraint PK_GRADE primary key(ID)
);

create table Formation(
	ID 					SMALLINT,
	nom 			varchar(50),
	constraint PK_Form primary key(ID)
);

-- ================================ With constraint foreign keys 
create table Etudiant(
	ID  		SMALLINT,
	ID_niv 		SMALLINT,
	nom 		varchar(30),
	prenom 		varchar(30),
	email 		varchar(50),
	genre  		varchar(10),
	adresse 	varchar(70),
	constraint 	PK_ETUD primary key(ID),
	constraint 	FK_ETUD_NIV foreign key(ID_niv) references Niveau(ID)
);

create table module(
	ID  		SMALLINT,
	ID_FORM 	SMALLINT,
	nom 		varchar(100),
	constraint PK_MOD primary key(ID),
	constraint FK_MOD_FORM foreign key(ID_FORM) references Formation(ID)
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
	constraint PK_ENS primary key(ID),
	constraint FK_ENS_GRADE foreign key(ID_grade) references Grade(ID),
	constraint FK_ENS_DEP foreign key(ID_Dep) references Departement(ID)
);
create table coordonner (
	id_ens 		SMALLINT ,
	id_form 	SMALLINT ,
	date_debut 	date ,
	date_fin 	date ,
	constraint PK_Cor primary key(id_ens , id_form),
	constraint FK_ENS_COR foreign key(id_ens) references Enseignant(ID),
	constraint FK_Form_COR foreign key(id_form) references Formation(ID)
);
create table Inscription(
	ID_et  				SMALLINT,
	ID_form  			SMALLINT,
	anneeUniversitaire 	Date,
	Niveau 				smallint,
	fraisFormation 		DECIMAL(10,3),
	constraint PK_INS primary key(ID_et, ID_form),
	constraint FK_INS_FORM foreign key(ID_form) references formation(ID),
	constraint FK_INS_ETUD foreign key(ID_et) references Etudiant(ID),
	constraint FK_INS_Niv foreign key(niveau) references  Niveau(ID)
);

create table paiement(
	ID 		SMALLINT,
	montantVerse 	DECIMAL(10,3),
	ID_INSCR_ET 	SMALLINT,
	ID_INSCR_FORM 	SMALLINT,
	recu 		VARCHAR(512) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL,
	observation 	varchar(200),
	constraint PK_PAIEMENT primary key(ID)
);

alter table paiement 
add constraint FK_PAIEMENT_INSCR foreign key(ID_INSCR_ET,ID_INSCR_FORM) references Inscription(ID_et, ID_form);

create table Element(
	ID  		SMALLINT,
	ID_MODULE 	SMALLINT,
	nom 		varchar(50),
	constraint PK_ELEM primary key(ID),
	constraint FK_ELEM_MOD foreign key(ID_MODULE) references module(ID)
);

ALTER TABLE Vacation
ADD CONSTRAINT FK_VAC_ENS foreign key(ID_ENS) references Enseignant(ID);

ALTER TABLE Vacation
add constraint FK_VAC_ELEM foreign key(ID_ELEM) references element(ID);
--=======================================
create table ProgrammeEmp(
	ID 					SMALLINT,
	ID_FORM 			SMALLINT NOT NULL,
	Intitule 			varchar(50),
	Exercice 			date,
	Date_Depot 			date,
	constraint PK_Rub primary key(ID),
	constraint FK_PEmp_Form foreign key(ID_FORM) references Formation(ID)
);

create table Sortie(
	ID_Rub 						INT,
	ID_PEmp 					SMALLINT,
	montant 					DECIMAL(10,4),
	constraint PK_SORT primary key(ID_Rub,ID_PEmp),
	constraint FK_SORT_PEmp foreign key(ID_PEmp) references ProgrammeEmp(ID),
	constraint FK_SORT_Rub foreign key(ID_Rub) references Rubrique(ID)
);

create table Dates(
	ID   			SMALLINT,
	ID_VAC 			SMALLINT,
	jour 			Date,
	constraint PK_DATE primary key(ID),
	constraint 	FK_DATE_VAC foreign key(ID_VAC) references vacation(ID)
);

CREATE TABLE role (
	id 			smallint primary key, -- agent|admin|Comptable
	designation varchar(100)
);

CREATE TABLE Admin (
	id 			int unsigned AUTO_INCREMENT,
	id_role 	smallint,
	nom 		varchar(50),
	pass 		varchar(50),
	telephone 	varchar(30),
	adresse 	varchar(255),
	email 		varchar(255),
	PRIMARY KEY (id),
	constraint 	FK_UTILIS_ROLE foreign key(id_role) references role(ID)
);

create table Valide (
	id_admin 		 INT unsigned,
	id_emp 		 	 SMALLINT ,
	status 			 varchar(20) , -- en cours | valid� | rejet�
	date_validation  date ,
	observation      varchar(255),
	constraint PK_Val primary key (id_admin,id_emp),
	constraint FK_Emp_Val foreign key (id_emp) references ProgrammeEmp(id),
	constraint FK_Admin_Val foreign key (id_admin) references Admin(id)
);



--======================== INSERT Rubriques

insert into rubrique values(9111009, "Personnel");
insert into rubrique values(9111010, "Indemnit�s et allocations ");
insert into rubrique values(9111011, "Indemnit�s compl�mentaires li�es aux formations continues");
insert into rubrique values(9111012, "Indemnit�s brutes des enseignants et des experts �trangers dans les domaines de la recherche scientifique et technologique, formations et travaux d'expertise");
insert into rubrique values(9111013, "R�mun�ration des post-doctorants travaillant dans le cadre de projets");
insert into rubrique values(9111014, "R�mun�ration des agents contractuels");
insert into rubrique values(9111015, "R�mun�ration des experts marocains et �trangers");
insert into rubrique values(9111110, "Frais et redevances");
insert into rubrique values(9111111, "Redevances pour brevets, marques, droits et valeurs similaires");
insert into rubrique values(9111112, "Frais d'�tudes, d'analyses et de sous-traltance");
insert into rubrique values(9111113, "Frais de r�alisation de maquettes et prototypes");
insert into rubrique values(9111114, "Frais d'�tudes et d'expertise");
insert into rubrique values(9111115, "Frais d'aconage et d'emmagasinage");
insert into rubrique values(9111116, "Redevances d'eau");
insert into rubrique values(9111117, "Redevances d'�lectricit�");
insert into rubrique values(9111118, "Taxes et redevances de t�l�communications");
insert into rubrique values(9111119, "Taxes et redevances pour l'utilisation de lignes ou r�seaux sp�cialis�s");
insert into rubrique values(9111120, "S�minaires, stages et formation");
insert into rubrique values(9111121, "Frais de formation");
insert into rubrique values(9111122, "Frais de stages et de s�minaires");
insert into rubrique values(9111123, "Frais de participation aux s�minaires, congr�s et colloques");
insert into rubrique values(9111124, "Frais de participation et d'inscription aux colloques, s�minaires et concours pour le personnel et les �tudiants chercheurs");
insert into rubrique values(9111125, "Frais d'organisation de colloques et de s�minaires");
insert into rubrique values(9111126, "Frais d'h�bergement et de restauration");
insert into rubrique values(9111127, "Frais de r�ception et de c�r�monies officielles");
insert into rubrique values(9111128, "Frais de distributions des prix");
insert into rubrique values(9111130, "Achat d'ouvrage, frais d'�dition");
insert into rubrique values(9111131, "Abonnements et documentation");
insert into rubrique values(9111132, "Achat d'ouvrages pour la biblioth�que");
insert into rubrique values(9111133, "Frais de reliure");
insert into rubrique values(9111134, "Annonces et insertions");
insert into rubrique values(9111135, "Frais de d�monstration et de publicit�");
insert into rubrique values(9111136, "Frais de participation aux foires et expositions");
insert into rubrique values(9111137, "Publications et impressions");
insert into rubrique values(9111140, "Am�nagement, entretien et �quipement");
insert into rubrique values(9111141, "Agencement, am�nagement et installation");
insert into rubrique values(9111142, "Etudes li�es �  la construction et �  l'am�nagement des b�timents administratifs");
insert into rubrique values(9111143, "Locations de b�timents administratifs et charges connexes");
insert into rubrique values(9111144, "Entretien et r�paration des b�timents p�dagogiques et administratifs");
insert into rubrique values(9111145, "Entretien et r�paration du mobilier, du mat�riel de bureau et du mat�riel d'impression");
insert into rubrique values(9111150, "Achat de fournitures");
insert into rubrique values(9111151, "Achats de petit outillage et pet �quipement");
insert into rubrique values(9111152, "Achat de fournitures informatiques");
insert into rubrique values(9111153, "Achat de fournitures et de produits pour les travaux de terrain et de laboratoire");
insert into rubrique values(9111154, "Achat de fournitures de bureau, papetrie et imprim�s");
insert into rubrique values(9111155, "Achat de mati�res premi�res");
insert into rubrique values(9111156, "Achat d'animaux de laboratoire");
insert into rubrique values(9111157, "Achat de produits pharmaceutiques");
insert into rubrique values(9111158, "Achat de carburants et lubrifiants");
insert into rubrique values(9111160, "Transports et d�placements");
insert into rubrique values(9111161, "Frais de transport du personnel et des �tudiants �  l'�tranger");
insert into rubrique values(9111162, "Frais de mission �  l'�tranger des participants");
insert into rubrique values(9111163, "Frais de transport du personnel et des �tudiants au Maroc");
insert into rubrique values(9111164, "Frais de transport du mobilier et du mat�riel");
insert into rubrique values(9111165, "Frais de transport et de s�jour des missionnaires et chercheurs �trangers");
insert into rubrique values(9111166, "Indemnit�s de d�placement �  l'int�rieur du Royaume");
insert into rubrique values(9111167, "Indemnit�s de d�placement �  l'int�rieur du Royaume des nationaux et des non-r�sidents");
insert into rubrique values(9111168, "Indemnit�s de mission �  l'�tranger");
insert into rubrique values(9111169, "Indemnit�s Klom�triques");
insert into rubrique values(9111170, "Mat�riel et mobilier");
insert into rubrique values(9111171, "Achat de mat�riel d'enseignement");
insert into rubrique values(9111172, "Achat de mat�riel technique, scientifique et audiovisuel");
insert into rubrique values(9111173, "Achat de mat�riel informatique et logiciels et de mat�riel d'atelier et de l'outilage");
insert into rubrique values(9111174, "Achat de mat�riel m�dical");
insert into rubrique values(9111175, "Achat de mat�riel et mobilier de bureau");
insert into rubrique values(9111176, "Achat de mobilier d'enseignement et de laboratoire");
insert into rubrique values(9111177, "Entretien et r�paration du mat�riel d'enseignement et du mat�riel scientifique et de laboratoire");
insert into rubrique values(9111178, "Entretien et r�paration du mat�riel et outilage");
insert into rubrique values(9111179, "Entretien et r�paration de mobilier de bureau, de l'enseignement et de laboratoire");
insert into rubrique values(9111180, "D�penses diverses");
insert into rubrique values(9111181, "Cotisation et contribution aux organismes nationaux et int�rationaux");
insert into rubrique values(9111182, "Restiution et remboursement");
insert into rubrique values(9111183, "Remboursement de la TVA et des Droits de douane");
insert into rubrique values(9111184, "Taxes postales et frais d'affranchissement");
insert into rubrique values(9111185, "Location de mat�riel de transport");
insert into rubrique values(9111186, "Pr�l�vement 10% ENSIAS");
insert into rubrique values(9111187, "Pr�l�vement 10% Pr�sidence");
insert into rubrique values(9111190, "Cr�dit �  programmer");

-- test inserts into grade

insert into grade values(1, "A");
insert into grade values(2, "B");
insert into grade values(3, "C");

-- test inserts into enseignant

insert into enseignant values(1001, 3, NULL, NULL, "Nabil", 	"Amri", 		"Nabil.Amri@mail.com", 			"interne");
insert into enseignant values(1002, 2, NULL, NULL, "Amal", 		"Asrioui", 		"Amal.Asrioui@mail.com", 		"externe");
insert into enseignant values(1003, 1, NULL, NULL, "Khalid", 	"Ben Hammou", 	"Khalid.BenHammou@mail.com", 	"interne");
insert into enseignant values(1004, 1, NULL, NULL, "Jamal", 	"Talbi", 		"Jamal.Talbi@mail.com", 		"interne");
insert into enseignant values(1005, 1, NULL, NULL, "Ziad", 		"Ait Salah", 	"Ziad.AitSalah@mail.com", 		"interne");
insert into enseignant values(1006, 1, NULL, NULL, "Ilham", 	"Oufquir", 		"Ilham.Oufquir@mail.com", 		"externe");
insert into enseignant values(1007, 3, NULL, NULL, "Mohammed", 	"Ajrioui", 		"Mohammed.Ajrioui@mail.com", 	"interne");
insert into enseignant values(1008, 1, NULL, NULL, "Salma", 	"Al Hadi", 		"Salma.AlHadi@mail.com", 		"interne");	
insert into enseignant values(1009, 3, NULL, NULL, "Manal", 	"Hamdi", 		"Manal.Hamdi@mail.com", 		"externe");
insert into enseignant values(1010, 2, NULL, NULL, "Kaoutar", 	"Mehdaoui", 	"Kaoutar.Mehdaoui@mail.com", 	"interne");
insert into enseignant values(1011, 2, NULL, NULL, "Imad", 		"Assfiri", 		"Imad.Assfiri@mail.com", 		"interne");

-- test insert formation

insert into formation values(123, "SSI");
insert into formation values(124, "GL");

-- test insert modules

insert into module values(1, 123, "Algorithmique et programmation");
insert into module values(2, 123, "Structures de donn�es");
insert into module values(3, 123, "Electronique num�rique et circuits logiques");
insert into module values(4, 123, "Architecture des ordinateurs et microprocesseur");
insert into module values(5, 123, "El�ments de recherche op�rationnelle");
insert into module values(6, 123, "Probabilit� appliqu�e");
insert into module values(7, 123, "Gestion, �conomie et finance 1");
insert into module values(8, 123, "Langue et communication 1");
insert into module values(9, 123, "Bases de donn�es relationnelles");
insert into module values(10, 123, "Informatiques th�oriques");
insert into module values(11, 123, "R�seaux de communication");
insert into module values(12, 123, "Syst�mes d�exploitation");
insert into module values(13, 123, "Programmation orient�e objet (POO)");
insert into module values(14, 123, "Gestion, �conomie et finance 2");
insert into module values(15, 123, "Langues et communication 2");
insert into module values(16, 123, "Projet de fin de premi�re ann�e");

-- test insert elements
insert into element(ID_MODULE, ID, nom) values(1, 1,"Algorithmique");
insert into element(ID_MODULE, ID, nom) values(1, 2,"Techniques de programmation");
insert into element(ID_MODULE, ID, nom) values(2, 3,"Structures de donn�es");
insert into element(ID_MODULE, ID, nom) values(2, 4,"Projet de programmation");
insert into element(ID_MODULE, ID, nom) values(3, 5,"Circuits logiques");
insert into element(ID_MODULE, ID, nom) values(3, 6,"Electronique num�rique");
insert into element(ID_MODULE, ID, nom) values(4, 7,"Assembleur microprocesseur");
insert into element(ID_MODULE, ID, nom) values(4, 8,"Architecture des ordinateurs");
insert into element(ID_MODULE, ID, nom) values(5, 9,"Th�orie des graphes");
insert into element(ID_MODULE, ID, nom) values(5, 10,"Programmation lin�aire");
insert into element(ID_MODULE, ID, nom) values(6, 11,"Probabilit�");
insert into element(ID_MODULE, ID, nom) values(6, 12,"Simulation des comportements probabilistes");
insert into element(ID_MODULE, ID, nom) values(7, 13,"Economie d�entreprise");
insert into element(ID_MODULE, ID, nom) values(7, 14,"Introduction au management de l�entreprise");
insert into element(ID_MODULE, ID, nom) values(7, 15,"Comptabilit� g�n�rale et gestion financi�re");
insert into element(ID_MODULE, ID, nom) values(8, 16,"Communication interpersonnelle");
insert into element(ID_MODULE, ID, nom) values(8, 17,"General english I");
insert into element(ID_MODULE, ID, nom) values(9, 18, "Bases de donn�es relationnelles");
insert into element(ID_MODULE, ID, nom) values(9, 19, "Programmation proc�durale de BD");
insert into element(ID_MODULE, ID, nom) values(10, 20,"Th�orie des langages");
insert into element(ID_MODULE, ID, nom) values(10, 21,"Calculabilit� et complexit�");
insert into element(ID_MODULE, ID, nom) values(10, 22,"Logique");
insert into element(ID_MODULE, ID, nom) values(11, 23,"Transmission de donn�es");
insert into element(ID_MODULE, ID, nom) values(11, 24,"R�seaux informatiques");
insert into element(ID_MODULE, ID, nom) values(12, 25,"Syst�mes d�exploitation");
insert into element(ID_MODULE, ID, nom) values(13, 26,"Paradigme objet");
insert into element(ID_MODULE, ID, nom) values(13, 27,"Programmation objet");
insert into element(ID_MODULE, ID, nom) values(14, 28,"Economie g�n�rale");
insert into element(ID_MODULE, ID, nom) values(14, 29,"Comptabilit� analytique");
insert into element(ID_MODULE, ID, nom) values(15, 30,"Communication professionnelle");
insert into element(ID_MODULE, ID, nom) values(15, 31,"General english II");
insert into element(ID_MODULE, ID, nom) values(16, 32,"Projet de fin de premi�re ann�e");




-- insert role 

insert into role values(1 , 'Administrateur');
insert into role values(2 , 'Comptable');


-- insert niveaux

insert into niveau values(1, "1A");
insert into niveau values(2, "2A");
insert into niveau values(3, "3A");

-- insert departement 
insert into departement  values(1, "Economie");
insert into departement values(2, "Recherche Operationnel");
insert into departement values(3, "Reseau");


--insert into enseignant values(ID, ID_niv, nom, prenom, 		email, 		genre, 		adresse);

insert into etudiant values(10001, 1, "Mohammed", "Boubekri", "mohammed.boubekri@mail.com", "masculin", "adresse");
insert into etudiant values(10002, 1, "Salma", "Ajaoued", 	"Salma.Ajaoued@mail.com", "Feminin", "adresse");
insert into etudiant values(10003, 3, "Naima", "Naji", 		"Naima.Naji@mail.com", "Feminin", "adresse");
insert into etudiant values(10004, 1, "Najat", "Hassoun", 	"Najat.Hassoun@mail.com", "Feminin", "adresse");
insert into etudiant values(10005, 2, "Hamza", "Ait Baha", 	"Hamza.AitBaha@mail.com", "masculin", "adresse");
insert into etudiant values(10006, 2, "Kamal", "Bouzekri", 	"Kamal.Bouzekri@mail.com", "masculin", "adresse");
insert into etudiant values(10007, 1, "Rabab", "Ben Sliman", 	"Rabab.BenSliman@mail.com", "Feminin", "adresse");
insert into etudiant values(10008, 1, "Jihad", "Slimani", 	"Jihad.Slimani@mail.com", "Feminin", "adresse");
insert into etudiant values(10009, 2, "Amal", "Benjebour", 	"Amal.Benjebour@mail.com", "Feminin", "adresse");
insert into etudiant values(10011, 3, "Kaoutar", "Aarab", 	"Kaoutar.Aarab@mail.com", "Feminin", "adresse");
insert into etudiant values(10022, 1, "Ayoub", "Bouallal", 	"Ayoub.Bouallal@mail.com", "masculin", "adresse");
insert into etudiant values(10010, 2, "Hamza", "Boukacha", 	"Hamza.Boukacha@mail.com", "masculin", "adresse");

insert into inscription values(10001 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10002 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10003 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10004 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10005 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10006 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10007 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10008 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10009 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;
insert into inscription values(10011 , 123 , '2020-01-01'/*STR_TO_DATE("1-1-2020","%d-%m-%y")*/ , 1,  1000.000) ;


insert into paiement values (1 , 1000.000 , 10001 , 123 , 'recu.txt' , "Observation" );
insert into paiement values (2 , 1000.000 , 10002 , 123 , 'recu1.txt' , "Observation" );
insert into paiement values (3 , 1000.000 , 10003 , 123 , 'recu2.txt' , "Observation" );
insert into paiement values (4 , 1000.000 , 10004 , 123 , 'recu3.txt' , "Observation" );
insert into paiement values (5 , 1000.000 , 10005 , 123 , 'recu4.txt' , "Observation" );
insert into paiement values (6 , 1000.000 , 10006 , 123 , 'recu5.txt' , "Observation" );
insert into paiement values (7 , 1000.000 , 10007 , 123 , 'recu6.txt' , "Observation" );
insert into paiement values (8 , 1000.000 , 10008 , 123 , 'recu7.txt' , "Observation" );

insert into Coordonner values (1001 , 123 , NULL , NULL);
insert into Coordonner values (1002 , 124 , NULL , NULL);

insert into ProgrammeEmp values (1 , 123 , "" , NULL  , "2020-01-01" ) ;
insert into ProgrammeEmp values (1 , 123 , "" , NULL  , "2020-01-01" ) ;

insert into Admin values (1 , 1 , 'Admin' , SHA1('root') , NULL , NULL , NULL );
insert into Admin values (2, 2 , 'Coordonnateur' , SHA1('cord') , NULL , NULL , NULL );

insert into vacation values(1001, 1002,  1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1002, 1006,  1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1003, 1003,  2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1004, 1007,  2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1005, 1001,  3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1006, 1007,  3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1007, 1008,  4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1008, 1008,  4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1009, 1001,  5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1010, 1005,  5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1011, 1010,  6, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1012, 1006,  6, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1013, 1004,  7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1014, 1003,  7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1015, 1004,  7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1016, 1008,  8, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1017, 1009,  8, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1018, 1011,  9, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1019, 1002,  9, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1020, 1005, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1021, 1006, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1022, 1007, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1023, 1005, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1024, 1004, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1025, 1003, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1026, 1010, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1027, 1011, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1028, 1006, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1029, 1011, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1030, 1003, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1031, 1005, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into vacation values(1032, 1004, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

