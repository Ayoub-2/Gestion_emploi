
create table Rubrique(
	ID 				SMALLINT,
	-- ID_PEmp 			SMALLINT,
	Libelle 			varchar(512),
	constraint PK_RUB primary key(ID)
	-- constraint FK_RUB_PEmp foreign key(ID_PEmp) references ProgrammeEmp(ID)
);
create table Niveau(
	ID  SMALLINT,
	nom varchar(30),
	constraint PK_NIV primary key(ID)
);

create table paiement(
	ID 		SMALLINT,
	montantVerse 	DECIMAL(5,3),
	recu 		VARCHAR(512) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL,
	observation 	varchar(200),
	constraint PK_PAIEMENT primary key(ID)
);

create table Vacation(
	ID   				SMALLINT,
	ID_ENS 				SMALLINT,
	taux 				DECIMAL(3,3),
	taxImpotRevenu 			DECIMAL(3,3),
	jour 				Date,
	montant 			DECIMAL(5,3),
	montantBrutArrandi 		DECIMAL(5,3),
	IR 				DECIMAL(3,3),
	IR_arrandi 			DECIMAL(3,3),
	net 				DECIMAL(5,3),
	constraint PK_VAC primary key(ID)
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

create table Formation(
	ID 					SMALLINT,
	nom 			varchar(30),
	constraint PK_Form primary key(ID)
);

-- ================================ With constraint foreign keys 
create table Etudiant(
	ID  		SMALLINT,
	ID_niv 		SMALLINT,
	nom 		varchar(30),
	prenom 		varchar(30),
	email 		varchar(50),
	genre  		char(10),
	adresse 	varchar(70),
	constraint 	PK_ETUD primary key(ID),
	constraint 	FK_ETUD_NIV foreign key(ID_niv) references Niveau(ID)
);

create table module(
	ID  		SMALLINT,
	ID_FORM 	SMALLINT,
	nom 		varchar(256),
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
	salaire  	DECIMAL(6,3),
	constraint PK_ENS primary key(ID),
	constraint FK_ENS_GRADE foreign key(ID_grade) references Grade(ID),
	constraint FK_ENS_DEP foreign key(ID_Dep) references Departement(ID)
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

create table Element(
	ID  		SMALLINT,
	ID_ENS 		SMALLINT,
	ID_MODULE 	SMALLINT,
	nom 		varchar(30),
	constraint PK_ELEM primary key(ID),
	constraint FK_ELEM_ENS foreign key(ID_ENS) references Enseignant(ID),
	constraint FK_ELEM_MOD foreign key(ID_MODULE) references module(ID)
);

ALTER TABLE Vacation
ADD CONSTRAINT FK_VAC_ENS foreign key(ID_ENS) references Enseignant(ID);
alter table Enseignant
ADD constraint FK_ENS_VAC foreign key(ID_vac) references Vacation(ID);
--=======================================

create table ProgrammeEmp(
	ID 					SMALLINT,
	ID_FORM 			SMALLINT NOT NULL,
	Intitule 			varchar(50),
	Responsable 		varchar(30),
	Exercice 			date,
	constraint PK_Rub primary key(ID),
	constraint FK_PEmp_Form foreign key(ID_FORM) references Formation(ID),
	constraint unique_format_exer UNIQUE(ID_FORM, Exercice)
);

create table sortie(
	ID_Rub 						INT,
	ID_PEmp 					SMALLINT,
	Date_sortie 					date,
	montant 					DECIMAL(10,4),
	constraint PK_SORT primary key(ID_Rub,ID_PEmp),
	constraint FK_SORT_PEmp foreign key(ID_PEmp) references ProgrammeEmp(ID),
	constraint FK_SORT_Rub foreign key(ID_Rub) references Rubrique(ID)
);
--======================== INSERT Rubriques

insert into rubrique values(9111009, "Personnel");
insert into rubrique values(9111010, "Indemnités et allocations ");
insert into rubrique values(9111011, "Indemnités complémentaires liées aux formations continues");
insert into rubrique values(9111012, "Indemnités brutes des enseignants et des experts étrangers dans les domaines de la recherche scientifique et technologique, formations et travaux d'expertise");
insert into rubrique values(9111013, "Rémunération des post-doctorants travaillant dans le cadre de projets");
insert into rubrique values(9111014, "Rémunération des agents contractuels");
insert into rubrique values(9111015, "Rémunération des experts marocains et étrangers");
insert into rubrique values(9111110, "Frais et redevances");
insert into rubrique values(9111111, "Redevances pour brevets, marques, droits et valeurs similaires");
insert into rubrique values(9111112, "Frais d'études, d'analyses et de sous-traltance");
insert into rubrique values(9111113, "Frais de réalisation de maquettes et prototypes");
insert into rubrique values(9111114, "Frais d'études et d'expertise");
insert into rubrique values(9111115, "Frais d'aconage et d'emmagasinage");
insert into rubrique values(9111116, "Redevances d'eau");
insert into rubrique values(9111117, "Redevances d'électricité");
insert into rubrique values(9111118, "Taxes et redevances de télécommunications");
insert into rubrique values(9111119, "Taxes et redevances pour l'utilisation de lignes ou réseaux spécialisés");
insert into rubrique values(9111120, "Séminaires, stages et formation");
insert into rubrique values(9111121, "Frais de formation");
insert into rubrique values(9111122, "Frais de stages et de séminaires");
insert into rubrique values(9111123, "Frais de participation aux séminaires, congrés et colloques");
insert into rubrique values(9111124, "Frais de participation et d'inscription aux colloques, séminaires et concours pour le personnel et les étudiants chercheurs");
insert into rubrique values(9111125, "Frais d'organisation de colloques et de séminaires");
insert into rubrique values(9111126, "Frais d'hébergement et de restauration");
insert into rubrique values(9111127, "Frais de réception et de cérémonies officielles");
insert into rubrique values(9111128, "Frais de distributions des prix");
insert into rubrique values(9111130, "Achat d'ouvrage, frais d'édition");
insert into rubrique values(9111131, "Abonnements et documentation");
insert into rubrique values(9111132, "Achat d'ouvrages pour la bibliothèque");
insert into rubrique values(9111133, "Frais de reliure");
insert into rubrique values(9111134, "Annonces et insertions");
insert into rubrique values(9111135, "Frais de démonstration et de publicité");
insert into rubrique values(9111136, "Frais de participation aux foires et expositions");
insert into rubrique values(9111137, "Publications et impressions");
insert into rubrique values(9111140, "Aménagement, entretien et équipement");
insert into rubrique values(9111141, "Agencement, aménagement et installation");
insert into rubrique values(9111142, "Etudes liées à  la construction et à  l'aménagement des bàtiments administratifs");
insert into rubrique values(9111143, "Locations de bàtiments administratifs et charges connexes");
insert into rubrique values(9111144, "Entretien et réparation des bàtiments pédagogiques et administratifs");
insert into rubrique values(9111145, "Entretien et réparation du mobilier, du matériel de bureau et du matériel d'impression");
insert into rubrique values(9111150, "Achat de fournitures");
insert into rubrique values(9111151, "Achats de petit outillage et pet équipement");
insert into rubrique values(9111152, "Achat de fournitures informatiques");
insert into rubrique values(9111153, "Achat de fournitures et de produits pour les travaux de terrain et de laboratoire");
insert into rubrique values(9111154, "Achat de fournitures de bureau, papetrie et imprimés");
insert into rubrique values(9111155, "Achat de matières premières");
insert into rubrique values(9111156, "Achat d'animaux de laboratoire");
insert into rubrique values(9111157, "Achat de produits pharmaceutiques");
insert into rubrique values(9111158, "Achat de carburants et lubrifiants");
insert into rubrique values(9111160, "Transports et déplacements");
insert into rubrique values(9111161, "Frais de transport du personnel et des étudiants à  l'étranger");
insert into rubrique values(9111162, "Frais de mission à  l'étranger des participants");
insert into rubrique values(9111163, "Frais de transport du personnel et des étudiants au Maroc");
insert into rubrique values(9111164, "Frais de transport du mobilier et du matériel");
insert into rubrique values(9111165, "Frais de transport et de séjour des missionnaires et chercheurs étrangers");
insert into rubrique values(9111166, "Indemnités de déplacement à  l'intérieur du Royaume");
insert into rubrique values(9111167, "Indemnités de déplacement à  l'intérieur du Royaume des nationaux et des non-résidents");
insert into rubrique values(9111168, "Indemnités de mission à  l'étranger");
insert into rubrique values(9111169, "Indemnités Klométriques");
insert into rubrique values(9111170, "Matériel et mobilier");
insert into rubrique values(9111171, "Achat de matériel d'enseignement");
insert into rubrique values(9111172, "Achat de matériel technique, scientifique et audiovisuel");
insert into rubrique values(9111173, "Achat de matériel informatique et logiciels et de matériel d'atelier et de l'outilage");
insert into rubrique values(9111174, "Achat de matériel médical");
insert into rubrique values(9111175, "Achat de matériel et mobilier de bureau");
insert into rubrique values(9111176, "Achat de mobilier d'enseignement et de laboratoire");
insert into rubrique values(9111177, "Entretien et réparation du matériel d'enseignement et du matériel scientifique et de laboratoire");
insert into rubrique values(9111178, "Entretien et réparation du matériel et outilage");
insert into rubrique values(9111179, "Entretien et réparation de mobilier de bureau, de l'enseignement et de laboratoire");
insert into rubrique values(9111180, "Dépenses diverses");
insert into rubrique values(9111181, "Cotisation et contribution aux organismes nationaux et intérationaux");
insert into rubrique values(9111182, "Restiution et remboursement");
insert into rubrique values(9111183, "Remboursement de la TVA et des Droits de douane");
insert into rubrique values(9111184, "Taxes postales et frais d'affranchissement");
insert into rubrique values(9111185, "Location de matériel de transport");
insert into rubrique values(9111186, "Prélèvement 10% ENSIAS");
insert into rubrique values(9111187, "Prélèvement 10% Présidence");
insert into rubrique values(9111190, "Crédit à  programmer");

-- test inserts into grade

insert into grade values(1, "A");
insert into grade values(2, "B");
insert into grade values(3, "C");

-- test inserts into enseignant

insert into enseignant values(1001, 3, NULL, NULL, "Nabil", 	"Amri", 		"Nabil.Amri@mail.com", 			"interne", 1550.0);
insert into enseignant values(1002, 2, NULL, NULL, "Amal", 		"Asrioui", 		"Amal.Asrioui@mail.com", 		"externe", 1300.0);
insert into enseignant values(1003, 1, NULL, NULL, "Khalid", 	"Ben Hammou", 	"Khalid.BenHammou@mail.com", 	"interne", 1200.0);
insert into enseignant values(1004, 1, NULL, NULL, "Jamal", 	"Talbi", 		"Jamal.Talbi@mail.com", 		"interne", 1000.0);
insert into enseignant values(1005, 1, NULL, NULL, "Ziad", 		"Ait Salah", 	"Ziad.AitSalah@mail.com", 		"interne", 1100.0);
insert into enseignant values(1006, 1, NULL, NULL, "Ilham", 	"Oufquir", 		"Ilham.Oufquir@mail.com", 		"externe", 1150.0);
insert into enseignant values(1007, 3, NULL, NULL, "Mohammed", 	"Ajrioui", 		"Mohammed.Ajrioui@mail.com", 	"interne", 1400.0);
insert into enseignant values(1008, 1, NULL, NULL, "Salma", 	"Al Hadi", 		"Salma.AlHadi@mail.com", 		"interne", 1200.0);	
insert into enseignant values(1009, 3, NULL, NULL, "Manal", 	"Hamdi", 		"Manal.Hamdi@mail.com", 		"externe", 1550.0);
insert into enseignant values(1010, 2, NULL, NULL, "Kaoutar", 	"Mehdaoui", 	"Kaoutar.Mehdaoui@mail.com", 	"interne", 1370.0);
insert into enseignant values(1011, 2, NULL, NULL, "Imad", 		"Assfiri", 		"Imad.Assfiri@mail.com", 		"interne", 1300.0);

-- test insert modules

insert into module values(1, 123, "Algorithmique et programmation");
insert into module values(2, 123, "Structures de données");
insert into module values(3, 123, "Electronique numérique et circuits logiques");
insert into module values(4, 123, "Architecture des ordinateurs et microprocesseur");
insert into module values(5, 123, "Eléments de recherche opérationnelle");
insert into module values(6, 123, "Probabilité appliquée");
insert into module values(7, 123, "Gestion, économie et finance 1");
insert into module values(8, 123, "Langue et communication 1");
insert into module values(9, 123, "Bases de données relationnelles");
insert into module values(10, 123, "Informatiques théoriques");
insert into module values(11, 123, "Réseaux de communication");
insert into module values(12, 123, "Systèmes d’exploitation");
insert into module values(13, 123, "Programmation orientée objet (POO)");
insert into module values(14, 123, "Gestion, économie et finance 2");
insert into module values(15, 123, "Langues et communication 2");
insert into module values(16, 123, "Projet de fin de première année");

-- test insert elements
insert into element(ID_MODULE, ID_ENS, ID, nom) values(1, 1002, 1,"Algorithmique");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(1, 1006, 2,"Techniques de programmation");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(2, 1003, 3,"Structures de données");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(2, 1007, 4,"Projet de programmation");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(3, 1001, 5,"Circuits logiques");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(3, 1007, 6,"Electronique numérique");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(4, 1008, 7,"Assembleur microprocesseur");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(4, 1008, 8,"Architecture des ordinateurs");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(5, 1001, 9,"Théorie des graphes");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(5, 1005, 10,"Programmation linéaire");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(6, 1010, 11,"Probabilité");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(6, 1006, 12,"Simulation des comportements probabilistes");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(7, 1004, 13,"Economie d’entreprise");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(7, 1003, 14,"Introduction au management de l’entreprise");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(7, 1004, 15,"Comptabilité générale et gestion financière");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(8, 1008, 16,"Communication interpersonnelle");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(8, 1009, 17,"General english I");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(9, 1011, 18,"Bases de données relationnelles");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(9, 1002, 19,"Programmation procédurale de BD");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(10, 1005, 20,"Théorie des langages");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(10, 1006, 21,"Calculabilité et complexité");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(10, 1007, 22,"Logique");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(11, 1005, 23,"Transmission de données");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(11, 1004, 24,"Réseaux informatiques");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(12, 1003, 25,"Systèmes d’exploitation");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(13, 1010, 26,"Paradigme objet");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(13, 1011, 27,"Programmation objet");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(14, 1006, 28,"Economie générale");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(14, 1011, 29,"Comptabilité analytique");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(15, 1003, 30,"Communication professionnelle");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(15, 1005, 31,"General english II");
insert into element(ID_MODULE, ID_ENS, ID, nom) values(16, 1004, 32,"Projet de fin de première année");



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
insert into etudiant values(10011, 3, "Kaoutar", "Aarab", 	"Kaoutar.Aarab@mail.com", "Feminin", "adresse");
insert into etudiant values(10022, 1, "Ayoub", "Bouallal", 	"Ayoub.Bouallal@mail.com", "masculin", "adresse");
insert into etudiant values(10010, 2, "Hamza", "Boukacha", 	"Hamza.Boukacha@mail.com", "masculin", "adresse");
insert into etudiant values(10008, 1, "Jihad", "Slimani", 	"Jihad.Slimani@mail.com", "Feminin", "adresse");
insert into etudiant values(10009, 2, "Amal", "Benjebour", 	"Amal.Benjebour@mail.com", "Feminin", "adresse");
