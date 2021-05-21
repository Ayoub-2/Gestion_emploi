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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                                    Se déonnecter</a>
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
                                        <span class="op-5 user-content">RÃ´le</span>
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
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-5">
                        <h4 class="page-title">Enseignants</h4>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                    <div class="col-12" >
                        <div class="card p-20" style="height: 100%;">
                            <table class="my-table-bordred table table-hover col-12">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nom</th>
                                        <th scope="col">Prenom</th>
                                        <th scope="col">Grade</th>
                                        <th scope="col">Type</th>
                                        <th scope="col">Salaire</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Elements enseignés</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%@page import="java.sql.*" %>
                                <%@page import="com.pfa.connectionProvide.ConnectionProvider" %>
                                <%
                                try{
                                	Connection connection = new ConnectionProvider().getConnection();
                                	Statement stm = connection.createStatement();
                                	ResultSet result = stm.executeQuery
										("select enseignant.ID, enseignant.nom, prenom, grade.nom, type, salaire, email  from enseignant INNER JOIN grade ON enseignant.ID_grade=grade.ID;");
                                	while(result.next()){
	                                %>
	                                    <tr>
	                                        <td><%=result.getInt(1)%></td>
	                                        <td><%=result.getString(2) %></td>
	                                        <td><%=result.getString(3) %></td> 
	                                        <td><%=result.getString(4) %></td> 
	                                        <td><%=result.getString(5) %></td>
	                                        <td><%=result.getBigDecimal(6) %></td>
	                                        <td><%=result.getString(7) %></td>
	                                        <td>
	                                        <% int ID_ens =  result.getInt(1);
	                                        Statement stm_1 = connection.createStatement();
	                                        ResultSet result_1 = stm_1.executeQuery("select nom from element where ID_ENS = "+ID_ens+";");
	                                        	while(result_1.next()){
	                                        		System.out.println(result_1.getString(1));
	                                        		out.write(result_1.getString(1)+"<br/>");
	                                        	}
	                                        %>
	                                        </td>
	                                    </tr>
	                                <%
	                                	}
	                                }catch(Exception e){
	                                	e.printStackTrace();
	                                }
                                %>
                                </tbody>
                            </table>
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






