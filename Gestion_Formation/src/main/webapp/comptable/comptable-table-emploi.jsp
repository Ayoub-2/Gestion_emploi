<!DOCTYPE html>
<html dir="ltr" lang="en" style="font-size: 17px">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="robots" content="noindex,nofollow">
    <title>Comptable</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="../dist/css/table.css" rel="stylesheet">
    
    <link href="../dist/css/style.min.css" rel="stylesheet">
    <link href="../dist/css/navbar.css" rel="stylesheet">
</head>

<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-layout="vertical" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <a class="navbar-brand" href="index.jsp">
                        <b class="logo-icon">
                            <img src="../assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                            <img src="../assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <span class="logo-text">
                            <img src="../assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                            <img src="../assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
                        </span>
                    </a>
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                            class="ti-menu ti-close"></i></a>
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav float-start me-auto">
                        <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search position-absolute">
                                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a
                                    class="srh-btn"><i class="ti-close"></i></a>
                            </form>
                        </li>
                    </ul>
                    <ul class="navbar-nav float-end">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="../assets/images/users/agent.png" alt="user" class="rounded-circle" width="31">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end user-dd animated" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-user m-r-5 m-l-5"></i>
                                    Profile</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet m-r-5 m-l-5"></i>
                                    Se d�connecter</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li>
                            <div class="user-profile d-flex no-block dropdown m-t-20">
                                <div class="user-pic"><img src="../assets/images/users/agent.png" alt="users" class="rounded-circle" width="40" /></div>
                                <div class="user-content hide-menu m-l-10">
                                        <h5 class="m-b-0 user-name font-medium">Nom <i class=""></i></h5>
                                        <span class="op-5 user-content">R�le</span>
                                </div>
                            </div>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="index.jsp" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span
                                class="hide-menu">Tableau de bord</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="comptable-profil.jsp" aria-expanded="false"><i
                                class="mdi mdi-account"></i><span class="hide-menu">Profile</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="comptable-table-emploi.jsp" aria-expanded="false"><i class="mdi mdi-table"></i><span
                                class="hide-menu">Table d'emploi</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="comptable-etudiant.jsp" aria-expanded="false"><i class="mdi mdi-school"></i><span
                                class="hide-menu">Etudiants</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="comptable-enseignant.jsp" aria-expanded="false"><i class="mdi mdi-human-greeting"></i><span
                                class="hide-menu">Enseignants</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>
       
        <div class="page-wrapper">
            <div class="row col-auto m-l-10">
                <nav class="navbar navbar-custom navbar-expand-md">
                    <ul class="navbar-nav">
                            <li class="nav-item active"><a class="nav-link" href="comptable-table-emploi.jsp">Formation 1</a></li>
                            <li class="nav-item"><a class="nav-link" href="comptable-table-emploi-form-1.jsp">Formation 2</a></li>
                    </ul>
                </nav>
            </div>
<form action="../emploi" method="post">
            <div class="page-breadcrumb">
                <div class="row align-items-start pb-3">
                    <div class="container">
                        <div class="row justify-content-end ">
                            <div class="col">
                                <h4 class="page-title">Table d'emploi</h4>
                            </div>
                            <div class="col-auto">
                                <button type="button" class="btn btn-warning">
                                    Modifier
                                </button>
                                <button type="submit" class="btn btn-danger">
                                    Souvegarder
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row justify-content-end">
                             	<input type="hidden" name="ID_formation" value="123">
                                <div class="col-sm-3">
                                    <label class="col-12">Intitul�</label>
                                    <div class="col-12 text-secondary">
                                        <input type="text" name="Intitule" class="form-control form-control-line"> 
                                    </div>
                                </div>
                                <div class="col-sm-3 offset-6">
                                    <label class="col-12">Programme d'emploi N�</label>
                                    <div class="col-12 text-secondary">
                                        <input type="text" name="ProgrammeEmpl" class="form-control form-control-line"> 
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-end p-t-10">
                                <div class="col-sm-3">
                                    <label class="col-12">Responsable</label>
                                    <div class="col-12 text-secondary">
                                        <input type="text" name="Responsable" class="form-control form-control-line"> 
                                    </div>
                                </div>
                                <div class="col-sm-3 offset-6">
                                    <label class="col-12">Exercice</label>
                                    <div class="col-12 text-secondary">
                                        <input type="text" name="Exercice" class="form-control form-control-line" placeholder="JJ/MM/AAAA"> 
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 center-block py-20 pt-2">
                            
                                <table class="my-table" id="table_emp" style="margin: 2px;">
                                <thead style="background-color: rgb(201, 208, 212);">
                                    <tr class="my-firstrow"><th>Art.</th><th>�</th><th>Ligne</th><th>D�signation des Rubriques</th><th>Cr�dit ouvert</th></tr>
                                </thead>
                                    <tbody>
                                        <tr><td>911</td><td>&nbsp;</td><td>&nbsp;</td><td>FORMATION CONTINUE, TRAVAUX DE RECHERCHE ET PRESTATIONS DE SERVICE</td><td></td></tr>
                                        <tr><td>&nbsp;</td><td>10</td><td>&nbsp;</td><td>Formation continue </td><td class="td-input"></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>9</td><td>Personnel</td><td class="td-input">
<input name="9111009" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>10</td><td>Indemnit�s et allocations </td><td class="td-input">
<input name="9111010" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>11</td><td>Indemnit�s compl�mentaires li�es aux formations continues</td><td class="td-input">
<input name="9111011" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>12</td><td>Indemnit�s brutes des enseignants et des experts �trangers dans les domaines de la recherche scientifique et technologique, formations et travaux d'expertise</td><td class="td-input">
<input name="9111012" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>13</td><td>R�mun�ration des post-doctorants travaillant dans le cadre de projets</td><td class="td-input">
<input name="9111013" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>14</td><td>R�mun�ration des agents contractuels</td><td class="td-input">
<input name="9111014" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>15</td><td>R�mun�ration des experts marocains et �trangers</td><td class="td-input">
<input name="9111015" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>MDD</td><td class="td-input"></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>10</td><td>Frais et redevances</td><td class="td-input">
<input name="9111110" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>11</td><td>Redevances pour brevets, marques, droits et valeurs similaires</td><td class="td-input">
<input name="9111111" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>12</td><td>Frais d'�tudes, d'analyses et de sous-traltance</td><td class="td-input">
<input name="9111112" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>13</td><td>Frais de r�alisation de maquettes et prototypes</td><td class="td-input">
<input name="9111113" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>14</td><td>Frais d'�tudes et d'expertise</td><td class="td-input">
<input name="9111114" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>15</td><td>Frais d'aconage et d'emmagasinage</td><td class="td-input">
<input name="9111115" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>16</td><td>Redevances d'eau</td><td class="td-input">
<input name="9111116" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>17</td><td>Redevances d'�lectricit�</td><td class="td-input">
<input name="9111117" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>18</td><td>Taxes et redevances de t�l�communications</td><td class="td-input">
<input name="9111118" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>19</td><td>Taxes et redevances pour l'utilisation de lignes ou r�seaux sp�cialis�s</td><td class="td-input">
<input name="9111119" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>20</td><td>S�minaires, stages et formation</td><td class="td-input">
<input name="9111120" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>21</td><td>Frais de formation</td><td class="td-input">
<input name="9111121" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>22</td><td>Frais de stages et de s�minaires</td><td class="td-input">
<input name="9111122" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>23</td><td>Frais de participation aux s�minaires, congr�s et colloques</td><td class="td-input">
<input name="9111123" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>24</td><td>Frais de participation et d'inscription aux colloques, s�minaires et concours pour le personnel et les �tudiants chercheurs</td><td class="td-input">
<input name="9111124" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>25</td><td>Frais d'organisation de colloques et de s�minaires</td><td class="td-input">
<input name="9111125" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>26</td><td>Frais d'h�bergement et de restauration</td><td class="td-input">
<input name="9111126" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>27</td><td>Frais de r�ception et de c�r�monies officielles</td><td class="td-input">
<input name="9111127" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>28</td><td>Frais de distributions des prix</td><td class="td-input">
<input name="9111128" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>30</td><td>Achat d'ouvrage, frais d'�dition</td><td class="td-input">
<input name="9111130" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>31</td><td>Abonnements et documentation</td><td class="td-input">
<input name="9111131" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>32</td><td>Achat d'ouvrages pour la biblioth�que</td><td class="td-input">
<input name="9111132" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>33</td><td>Frais de reliure</td><td class="td-input">
<input name="9111133" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>34</td><td>Annonces et insertions</td><td class="td-input">
<input name="9111134" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>35</td><td>Frais de d�monstration et de publicit�</td><td class="td-input">
<input name="9111135" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>36</td><td>Frais de participation aux foires et expositions</td><td class="td-input">
<input name="9111136" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>37</td><td>Publications et impressions</td><td class="td-input">
<input name="9111137" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>40</td><td>Am�nagement, entretien et �quipement</td><td class="td-input">
<input name="9111140" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>41</td><td>Agencement, am�nagement et installation</td><td class="td-input">
<input name="9111141" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>42</td><td>Etudes li�es � la construction et � l'am�nagement des b�timents administratifs</td><td class="td-input">
<input name="9111142" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>43</td><td>Locations de b�timents administratifs et charges connexes</td><td class="td-input">
<input name="9111143" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>44</td><td>Entretien et r�paration des b�timents p�dagogiques et administratifs</td><td class="td-input">
<input name="9111144" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>45</td><td>Entretien et r�paration du mobilier, du mat�riel de bureau et du mat�riel d'impression</td><td class="td-input">
<input name="9111145" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>50</td><td>Achat de fournitures</td><td class="td-input">
<input name="9111150" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>51</td><td>Achats de petit outillage et pet �quipement</td><td class="td-input">
<input name="9111151" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>52</td><td>Achat de fournitures informatiques</td><td class="td-input">
<input name="9111152" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>53</td><td>Achat de fournitures et de produits pour les travaux de terrain et de laboratoire</td><td class="td-input">
<input name="9111153" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>54</td><td>Achat de fournitures de bureau, papetrie et imprim�s</td><td class="td-input">
<input name="9111154" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>55</td><td>Achat de mati�res premi�res</td><td class="td-input">
<input name="9111155" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>56</td><td>Achat d'animaux de laboratoire</td><td class="td-input">
<input name="9111156" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>57</td><td>Achat de produits pharmaceutiques</td><td class="td-input">
<input name="9111157" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>58</td><td>Achat de carburants et lubrifiants</td><td class="td-input">
<input name="9111158" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>60</td><td>Transports et d�placements</td><td class="td-input">
<input name="9111160" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>61</td><td>Frais de transport du personnel et des �tudiants � l'�tranger</td><td class="td-input">
<input name="9111161" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>62</td><td>Frais de mission � l'�tranger des participants</td><td class="td-input">
<input name="9111162" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>63</td><td>Frais de transport du personnel et des �tudiants au Maroc</td><td class="td-input">
<input name="9111163" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>64</td><td>Frais de transport du mobilier et du mat�riel</td><td class="td-input">
<input name="9111164" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>65</td><td>Frais de transport et de s�jour des missionnaires et chercheurs �trangers</td><td class="td-input">
<input name="9111165" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>66</td><td>Indemnit�s de d�placement � l'int�rieur du Royaume</td><td class="td-input">
<input name="9111166" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>67</td><td>Indemnit�s de d�placement � l'int�rieur du Royaume des nationaux et des non-r�sidents</td><td class="td-input">
<input name="9111167" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>68</td><td>Indemnit�s de mission � l'�tranger</td><td class="td-input">
<input name="9111168" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>69</td><td>Indemnit�s Klom�triques</td><td class="td-input">
<input name="9111169" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>70</td><td>Mat�riel et mobilier</td><td class="td-input">
<input name="9111170" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>71</td><td>Achat de mat�riel d'enseignement</td><td class="td-input">
<input name="9111171" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>72</td><td>Achat de mat�riel technique, scientifique et audiovisuel</td><td class="td-input">
<input name="9111172" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>73</td><td>Achat de mat�riel informatique et logiciels et de mat�riel d'atelier et de l'outilage</td><td class="td-input">
<input name="9111173" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>74</td><td>Achat de mat�riel m�dical</td><td class="td-input">
<input name="9111174" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>75</td><td>Achat de mat�riel et mobilier de bureau</td><td class="td-input">
<input name="9111175" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>76</td><td>Achat de mobilier d'enseignement et de laboratoire</td><td class="td-input">
<input name="9111176" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>77</td><td>Entretien et r�paration du mat�riel d'enseignement et du mat�riel scientifique et de laboratoire</td><td class="td-input">
<input name="9111177" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>78</td><td>Entretien et r�paration du mat�riel et outilage</td><td class="td-input">
<input name="9111178" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>79</td><td>Entretien et r�paration de mobilier de bureau, de l'enseignement et de laboratoire</td><td class="td-input">
<input name="9111179" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>80</td><td>D�penses diverses</td><td class="td-input">
<input name="9111180" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>81</td><td>Cotisation et contribution aux organismes nationaux et int�rationaux</td><td class="td-input">
<input name="9111181" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>82</td><td>Restiution et remboursement</td><td class="td-input">
<input name="9111182" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>83</td><td>Remboursement de la TVA et des Droits de douane</td><td class="td-input">
<input name="9111183" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>84</td><td>Taxes postales et frais d'affranchissement</td><td class="td-input">
<input name="9111184" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>85</td><td>Location de mat�riel de transport</td><td class="td-input">
<input name="9111185" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>Pr�l�vement 10% ENSIAS</td><td class="td-input">
<input name="9111186" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>Pr�l�vement 10% Pr�sidence</td><td class="td-input">
<input name="9111187" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>90</td><td>Cr�dit � programmer</td><td class="td-input">
<input name="9111190" class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>Total</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td></td></tr>
                                </tbody></table>
                                </form>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../dist/js/app-style-switcher.js"></script>
    <script src="../dist/js/waves.js"></script>
    <script src="../dist/js/sidebarmenu.js"></script>
    <script src="../dist/js/custom.js"></script>
</body>

</html>