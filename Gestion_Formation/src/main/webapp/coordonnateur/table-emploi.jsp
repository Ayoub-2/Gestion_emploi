<%@ page errorPage="error.jsp" %> 
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.pfa.connectionProvide.*" %>
<%!
public String capitalise(String str) {
	String output = str.substring(0, 1).toUpperCase() + str.substring(1);
	return output;
}
%>
<%
	 Connection con ;
   PreparedStatement preparedStatement;
   ResultSet rs,rs1;
   int id_form = (Integer) request.getAttribute("name");
   con = (new ConnectionProvider()).getConnection();
   preparedStatement = con.prepareStatement("SELECT nom FROM formation where id=? ");
   preparedStatement.setInt(1 , id_form);
   rs = preparedStatement.executeQuery();
   String Formation_name  = null;
   while (rs.next()) {
	   Formation_name = rs.getString(1);
   }
   preparedStatement = con.prepareStatement("select ES.nom ,ES.prenom , Intitule , Exercice  from programmeemp P join enseignant  ES on ES.id=P.id_responsable where id_form = 1 ");
   preparedStatement.setInt(1 , id_form);
   rs = preparedStatement.executeQuery();
   String Intitule= "", Exercice="" , Responsable = "";
   while (rs.next()) {
	   Intitule = capitalise(rs.getString(1)) + " " + capitalise(rs.getString(2));
	   Exercice = capitalise(rs.getString(3));
	   Responsable = capitalise(rs.getString(4)) ;
   }
%>
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
    <link href="../dist/css/style.min.css" rel="stylesheet">
    <link href="../dist/css/table.css" rel="stylesheet">
    <link href="../dist/css/navbar.css" rel="stylesheet">
    <link href="../dist/css/style.min.css" rel="stylesheet">
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
                                    Se dÃ©connecter</a>
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
                                    <a href="#" class="" id="Userdd" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <h5 class="m-b-0 user-name font-medium">Steave Jobs <i
                                                class=""></i></h5> <span class="op-5 user-email">Admin</span> </a>
                                </div>
                            </div>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="index.jsp" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span
                                    class="hide-menu">Tableau de bord</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="profile.jsp" aria-expanded="false"><i
                                    class="mdi mdi-account-circle"></i><span class="hide-menu">Profile</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="Enseignant.jsp" aria-expanded="false"><i class="mdi mdi-human-greeting"></i><span
                                    class="hide-menu">Enseignant</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="grade.jsp" aria-expanded="false"><i class="mdi mdi-layers"></i><span
                                    class="hide-menu">Grade</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="departement.jsp" aria-expanded="false"><i class="mdi mdi-bank"></i><span
                                    class="hide-menu">Departement</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="etudiant.jsp" aria-expanded="false"><i class="mdi mdi-school"></i><span
                                    class="hide-menu">Etudiant</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="niveau.jsp" aria-expanded="false"><i class="mdi mdi-buffer"></i><span
                                    class="hide-menu">Niveau</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="formation.jsp" aria-expanded="false"><i class="mdi mdi-book"></i><span
                                    class="hide-menu">Formation</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="modules.jsp" aria-expanded="false"><i class="mdi mdi-book-multiple"></i><span
                                    class="hide-menu">Module</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="report.jsp" aria-expanded="false"><i class="mdi mdi-alert-outline"></i><span
                                    class="hide-menu">Bug Report</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>
       
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row align-items-start">
                    <div class="container">
                        <div class="row justify-content-end ">
                            <div class="col">
                                <h4 class="page-title">Table d'emploi</h4>
                            </div>
                            <div class="col-auto">
                                <button type="button" class="btn btn-warning ">
                                    Modifier
                                </button>
                                <button type="button" class="btn btn-danger" onclick="souvegarader()">
                                    Souvegarder
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script language="javascript">
                function souvegarader(){
                    var tab_input = document.getElementsByClassName("tab_input");
                    alert("helo"+tab_input[0].value);
                    Array.prototype.forEach.call(tab_input, function(t_input) {
                        // Do stuff here
                        if(t_input == "") alert("5555");
                    });
                }
            </script>
            <div class="container-fluid">
                </style>
                
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="container"><%=Formation_name %></h4>
                            <hr width="0">
                            <div class="row justify-content-end">
                                <div class="col-sm-3">
                                    <label class="col-12">IntitulÃ©</label>
                                    <div class="col-12 text-secondary">
                                        <input type="text" class="form-control form-control-line"> 
                                    </div>
                                </div>
                                <div class="col-sm-3 offset-6">
                                    <label class="col-12">Programme d'emploi NÂ°</label>
                                    <div class="col-12 text-secondary">
                                        <input type="text" class="form-control form-control-line"> 
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-end p-t-10">
                                <div class="col-sm-3">
                                    <label class="col-12">Responsable</label>
                                    <div class="col-12 text-secondary">
                                        <input type="text" class="form-control form-control-line"> 
                                    </div>
                                </div>
                                <div class="col-sm-3 offset-6">
                                    <label class="col-12">Exercice</label>
                                    <div class="col-12 text-secondary">
                                        <input type="text" class="form-control form-control-line"> 
                                    </div>
                                </div>
                            </div>

                        

                            <div class="col-11 center-block p-20">
                                <table class="my-table" id="table_emp" style="margin: 2px;">
                                <thead style="background-color: rgb(129, 164, 187);">
                                    <tr class="my-firstrow"><th>Art.</th><th>Â§</th><th>Ligne</th><th>DÃ©signation des Rubriques</th><th>CrÃ©dit ouvert</th></tr>
                                </thead>
                                    <tbody>
                                        <tr><td>911</td><td>&nbsp;</td><td>&nbsp;</td><td>FORMATION CONTINUE, TRAVAUX DE RECHERCHE ET PRESTATIONS DE SERVICE</td><td></td></tr>
                                        <tr><td>&nbsp;</td><td>10</td><td>&nbsp;</td><td>Formation continue </td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>Personnel</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>10</td><td>IndemnitÃ©s et allocations </td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>11</td><td>IndemnitÃ©s complÃ©mentaires liÃ©es aux formations continues</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>12</td><td>IndemnitÃ©s brutes des enseignants et des experts Ã©trangers dans les domaines de la recherche scientifique et technologique, formations et travaux d'expertise</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>13</td><td>RÃ©munÃ©ration des post-doctorants travaillant dans le cadre de projets</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>14</td><td>RÃ©munÃ©ration des agents contractuels</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>15</td><td>RÃ©munÃ©ration des experts marocains et Ã©trangers</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>MDD</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>10</td><td>Frais et redevances</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>11</td><td>Redevances pour brevets, marques, droits et valeurs similaires</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>12</td><td>Frais d'Ã©tudes, d'analyses et de sous-traltance</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>13</td><td>Frais de rÃ©alisation de maquettes et prototypes</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>14</td><td>Frais d'Ã©tudes et d'expertise</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>15</td><td>Frais d'aconage et d'emmagasinage</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>16</td><td>Redevances d'eau</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>17</td><td>Redevances d'Ã©lectricitÃ©</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>18</td><td>Taxes et redevances de tÃ©lÃ©communications</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>19</td><td>Taxes et redevances pour l'utilisation de lignes ou rÃ©seaux spÃ©cialisÃ©s</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>20</td><td>SÃ©minaires, stages et formation</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>21</td><td>Frais de formation</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>22</td><td>Frais de stages et de sÃ©minaires</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>23</td><td>Frais de participation aux sÃ©minaires, congrÃ©s et colloques</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>24</td><td>Frais de participation et d'inscription aux colloques, sÃ©minaires et concours pour le personnel et les Ã©tudiants chercheurs</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>25</td><td>Frais d'organisation de colloques et de sÃ©minaires</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>26</td><td>Frais d'hÃ©bergement et de restauration</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>27</td><td>Frais de rÃ©ception et de cÃ©rÃ©monies officielles</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>28</td><td>Frais de distributions des prix</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>30</td><td>Achat d'ouvrage, frais d'Ã©dition</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>31</td><td>Abonnements et documentation</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>32</td><td>Achat d'ouvrages pour la bibliothÃ¨que</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>33</td><td>Frais de reliure</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>34</td><td>Annonces et insertions</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>35</td><td>Frais de dÃ©monstration et de publicitÃ©</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>36</td><td>Frais de participation aux foires et expositions</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>37</td><td>Publications et impressions</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>40</td><td>AmÃ©nagement, entretien et Ã©quipement</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>41</td><td>Agencement, amÃ©nagement et installation</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>42</td><td>Etudes liÃ©es Ã  la construction et Ã  l'amÃ©nagement des bÃ¢timents administratifs</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>43</td><td>Locations de bÃ¢timents administratifs et charges connexes</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>44</td><td>Entretien et rÃ©paration des bÃ¢timents pÃ©dagogiques et administratifs</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>45</td><td>Entretien et rÃ©paration du mobilier, du matÃ©riel de bureau et du matÃ©riel d'impression</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>50</td><td>Achat de fournitures</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>51</td><td>Achats de petit outillage et pet Ã©quipement</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>52</td><td>Achat de fournitures informatiques</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>53</td><td>Achat de fournitures et de produits pour les travaux de terrain et de laboratoire</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>54</td><td>Achat de fournitures de bureau, papetrie et imprimÃ©s</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>55</td><td>Achat de matiÃ¨res premiÃ¨res</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>56</td><td>Achat d'animaux de laboratoire</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>57</td><td>Achat de produits pharmaceutiques</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>58</td><td>Achat de carburants et lubrifiants</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>60</td><td>Transports et dÃ©placements</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>61</td><td>Frais de transport du personnel et des Ã©tudiants Ã  l'Ã©tranger</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>62</td><td>Frais de mission Ã  l'Ã©tranger des participants</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>63</td><td>Frais de transport du personnel et des Ã©tudiants au Maroc</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>64</td><td>Frais de transport du mobilier et du matÃ©riel</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>65</td><td>Frais de transport et de sÃ©jour des missionnaires et chercheurs Ã©trangers</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>66</td><td>IndemnitÃ©s de dÃ©placement Ã  l'intÃ©rieur du Royaume</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>67</td><td>IndemnitÃ©s de dÃ©placement Ã  l'intÃ©rieur du Royaume des nationaux et des non-rÃ©sidents</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>68</td><td>IndemnitÃ©s de mission Ã  l'Ã©tranger</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>69</td><td>IndemnitÃ©s KlomÃ©triques</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>70</td><td>MatÃ©riel et mobilier</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>71</td><td>Achat de matÃ©riel d'enseignement</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>72</td><td>Achat de matÃ©riel technique, scientifique et audiovisuel</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>73</td><td>Achat de matÃ©riel informatique et logiciels et de matÃ©riel d'atelier et de l'outilage</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>74</td><td>Achat de matÃ©riel mÃ©dical</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>75</td><td>Achat de matÃ©riel et mobilier de bureau</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>76</td><td>Achat de mobilier d'enseignement et de laboratoire</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>77</td><td>Entretien et rÃ©paration du matÃ©riel d'enseignement et du matÃ©riel scientifique et de laboratoire</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>78</td><td>Entretien et rÃ©paration du matÃ©riel et outilage</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>79</td><td>Entretien et rÃ©paration de mobilier de bureau, de l'enseignement et de laboratoire</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>80</td><td>DÃ©penses diverses</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>81</td><td>Cotisation et contribution aux organismes nationaux et intÃ©rationaux</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>82</td><td>Restiution et remboursement</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>83</td><td>Remboursement de la TVA et des Droits de douane</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>84</td><td>Taxes postales et frais d'affranchissement</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>85</td><td>Location de matÃ©riel de transport</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>PrÃ©lÃ¨vement 10% ENSIAS</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>PrÃ©lÃ¨vement 10% PrÃ©sidence</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>&nbsp;</td><td>&nbsp;</td><td>90</td><td>CrÃ©dit Ã  programmer</td><td class="td-input"><input class="tab_input" type="text" size="12"/></td></tr>
                                        <tr><td>Total</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td></td></tr>
                                </tbody></table>
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