<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.pfa.connectionProvide.*" %>
<%
   Connection con ;
   PreparedStatement preparedStatement;
   ResultSet rs;
   %>
<!DOCTYPE html>
<html dir="admin" lang="en" style="font-size: 17px">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="keywords"
         content=" ">
      <meta name=" ">
      <meta name="robots" content="noindex,nofollow">
      <title>PFA</title>
      <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <link href="../dist/css/style.min.css" rel="stylesheet">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <link href="../dist/css/table.css" rel="stylesheet">
   </head>
   <body>
      <div class="preloader">
         <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
         </div>
      </div>
      <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
         <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
               <div class="navbar-header" data-logobg="skin5">
                  <a class="navbar-brand" href="index.jsp"> <b class="logo-icon">
                  <img src="../assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                  <img src="../assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                  </b> <span class="logo-text">
                  <img src="../assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                  <img src="../assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
                  </span> </a> <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                     class="ti-menu ti-close"></i></a> 
               </div>
               <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                  <ul class="navbar-nav float-start me-auto">
                     <li class="nav-item search-box">
                        <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                        <form class="app-search position-absolute">
                           <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a> 
                        </form>
                     </li>
                  </ul>
                  <ul class="navbar-nav float-end">
                     <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="../assets/images/users/agent.png" alt="user" class="rounded-circle" width="31">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end user-dd animated" aria-labelledby="navbarDropdown">
                           <a class="dropdown-item" href="profile.jsp"><i class="ti-user m-r-5 m-l-5"></i>
                           Profile</a>
                           <a class="dropdown-item" href="profile.jsp"><i class="ti-wallet m-r-5 m-l-5"></i>
                           Logout</a>
                        </ul>
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
                                    class=""></i></h5>
                                 <span class="op-5 user-email">Coordonnateur</span> 
                              </a>
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
               <div class="row align-items-center">
                  <div class="col-5">
                     <h4 class="page-title">Enseignant</h4>
                     <div class="d-flex align-items-center">
                     </div>
                  </div>
                  <div class="col-7">
                     <div class="text-end">
                        <a href="" class="btn btn-primary mb-4" style="padding: 10px" data-toggle="modal" data-target="#AddEns">Ajouter un Enseignant</a>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Ajouter Professeur -->
            <div class="modal" id="AddEns">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <!-- Modal Header -->
                     <div class="modal-header p-5 text-center bg-light">
                        <h4 class="modal-title mb-3">Ajouter Un Enseignant</h4>
                     </div>
                     <!-- Modal body -->
                     <div class="modal-body">
                        <form class="form-horizontal form-material mx-3" action="./add" method="post">
                           <input type="hidden" name="action" value="4">
                           <div class="form-group ">
                              <div class="row align-content-between mx-3">
                                 <div class="col-sm-6 p-l-0" >
                                    <label class="col-12">Nom</label>
                                    <input type="text" name="nom" class="form-control form-control-line">
                                 </div>
                                 <div class="col-sm-6 p-r-0">
                                    <label class="col-12">Prenom</label>
                                    <input type="text" name="prenom" class="form-control form-control-line">
                                 </div>
                              </div>
                           </div>
                           <br/>
                           <div class="form-group ">
                              <label for="example-email" class="col-md-12 ">Email</label>
                              <div class="col-sm-12">
                                 <input type="email" placeholder="nom@prenom.com"
                                    class="form-control form-control-line" name="email"
                                    id="example-email">
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Genre</label>
                              <div class="col-sm-12">
                                 <select class="form-select shadow-none form-control-line" name="genre">
                                    <option>Homme</option>
                                    <option>Femme</option>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Element</label>
                              <div class="col-sm-12">
                                 <select class="form-select shadow-none form-control-line" name="element">
                                    <%
                                       con = (new ConnectionProvider()).getConnection();
                                       preparedStatement = con.prepareStatement("SELECT nom FROM element ");
                                       rs = preparedStatement.executeQuery();
                                       while (rs.next()) {
                                       %>
                                    <option><%=rs.getString(1) %></option>
                                    <%
                                       }%>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Departement</label>
                              <div class="col-sm-12">
                                 <select class="form-select shadow-none form-control-line" name="departement">
                                    <%
                                       con = (new ConnectionProvider()).getConnection();
                                       preparedStatement = con.prepareStatement("SELECT nom FROM departement ");
                                       rs = preparedStatement.executeQuery();
                                       while (rs.next()) {
                                       %>
                                    <option><%=rs.getString(1) %></option>
                                    <%
                                       }%>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Grade</label>
                              <div class="col-sm-12">
                                 <select class="form-select shadow-none form-control-line" name="grade">
                                    <%
                                       con = (new ConnectionProvider()).getConnection();
                                       preparedStatement = con.prepareStatement("SELECT nom FROM grade ");
                                       rs = preparedStatement.executeQuery();
                                       while (rs.next()) {
                                       %>
                                    <option><%=rs.getString(1) %></option>
                                    <%
                                       }%>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="row">
                                 <div class="col-sm-6  py-2 center-block ">
                                    <button class="btn btn-success text-white col-12" type="submit" onclick="addUser()">Ajouter</button>
                                 </div>
                                 <div class="col-sm-6 py-2 center-block">
                                    <button type="button" class="btn btn-danger col-12" data-dismiss="modal">Quiter</button>
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
            <!------- Add User Script---------->
            <script>
               function addUser(){
                   
               }
            </script>
            <!-- Modifier Professeur -->
            <div class="modal" id="UpdateProf">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header p-5 text-center bg-light">
                        <h4 class="modal-title mb-3">Modifier DonnÃ©es Ensaignant</h4>
                     </div>
                     <div class="modal-body">
                        <form class="form-horizontal form-material mx-3" action="./modify" method="post">
                           <input type="hidden" name="action" value="4">
                           <input type="hidden" id="id_ens" name="id_ens" value="">
                           <div class="form-group ">
                              <div class="row align-content-between mx-3">
                                 <div class="col-sm-6 p-l-0" >
                                    <label for="nom-prof" class="col-12">Nom</label>
                                    <input type="text" name="nom" id="prenom-prof" class="form-control form-control-line">
                                 </div>
                                 <div class="col-sm-6 p-r-0">
                                    <label for="prenom-prof" class="col-12">Prenom</label>
                                    <input name="prenom" id="prenom-prof" type="text" class="form-control form-control-line">
                                 </div>
                              </div>
                           </div>
                           <div class="form-group ">
                              <label for="example-email" class="col-md-12 ">Email</label>
                              <div class="col-sm-12">
                                 <input type="email" placeholder="example@um5.ac.ma"
                                    class="form-control form-control-line" name="email"
                                    id="example-email" >
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">type</label>
                              <div class="col-sm-12">
                                 <select name="type" class="form-select shadow-none form-control-line">
                                    <option>Vacataire</option>
                                    <option>Permanent</option>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Adresse</label>
                              <div class="col-sm-12">
                                 <textarea name="adresse" class="form-control form-control-line" 
                                    rows="3"></textarea>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Grade</label>
                              <div class="col-sm-12">
                                 <select name="grade" class="form-select shadow-none form-control-line">
                                    <%
                                       con = (new ConnectionProvider()).getConnection();
                                       preparedStatement = con.prepareStatement("SELECT nom FROM grade ");
                                       rs = preparedStatement.executeQuery();
                                       while (rs.next()) {
                                       %>
                                    <option><%=rs.getString(1) %></option>
                                    <%
                                       }%>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Departement</label>
                              <div class="col-sm-12">
                                 <select name="departement" class="form-select shadow-none form-control-line">
                                    <%
                                       con = (new ConnectionProvider()).getConnection();
                                       preparedStatement = con.prepareStatement("SELECT nom FROM departement ");
                                       rs = preparedStatement.executeQuery();
                                       while (rs.next()) {
                                       %>
                                    <option><%=rs.getString(1) %></option>
                                    <%
                                       }%>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Element</label>
                              <div class="col-sm-12">
                                 <select name="element" class="form-select shadow-none form-control-line">
                                    <%
                                       con = (new ConnectionProvider()).getConnection();
                                       preparedStatement = con.prepareStatement("SELECT nom FROM element ");
                                       rs = preparedStatement.executeQuery();
                                       while (rs.next()) {
                                       %>
                                    <option><%=rs.getString(1) %></option>
                                    <%
                                       }%>
                                 </select>
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="row">
                                 <div class="col-sm-6  py-2 center-block ">
                                    <button class="btn btn-success text-white col-12" type="submit" onclick="updateProf()">Valider</button>
                                 </div>
                                 <div class="col-sm-6 py-2 center-block">
                                    <button  type="button" class="btn btn-danger col-12" data-dismiss="modal">Quiter</button>
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
            <form action="./delete" id="delete" method="post">
               <input type="hidden" name="action" value="4" >
               <input type="hidden" name="del_id" id="del_id" value="">
               <button type="submit" style="display: none;"></button>
            </form>
            <script>
               function ModifyNiveau(id){
                document.getElementById('id_niveau').value = id;
                }
               function DeleteItem(id) {
                document.getElementById('del_id').value = id;
                document.getElementById('delete').submit();
               }
            </script>
            <div class="container-fluid">
               <div class="col-12">
                  <div class="card" style="padding: 20px">
                     <table class="my-table-bordred table-bordered col-12">
                        <thead>
                           <tr>
                              <th scope="col">#</th>
                              <th scope="col">Nom</th>
                              <th scope="col">Prenom</th>
                              <th scope="col">Email</th>
                              <th scope="col">Type</th>
                              <th scope="col">Grade</th>
                              <th scope="col">Departement</th>
                              <th scope="col">Elements</th>
                              <th  class="col-1" colspan=2>
                                 <center>Action </center>
                              </th>
                           </tr>
                        </thead>
                        <tbody>
                           <%
                              con = (new ConnectionProvider()).getConnection();
                              preparedStatement = con.prepareStatement("SELECT E.id , E.nom , prenom ,  email , type , G.nom , D.nom  FROM enseignant E join grade G on E.id_grade=G.id  join departement D on D.id=E.id_dep  ");
                              rs = preparedStatement.executeQuery();
                              int i = 0; 
                              while (rs.next()) {
                              %>
                           <tr>
                              <td><%=++i %></td>
                              <td><%=rs.getString(2) %></td>
                              <td><%=rs.getString(3) %></td>
                              <td><%=rs.getString(4) %></td>
                              <td><%=rs.getString(5) %></td>
                              <td><%=rs.getString(6) %></td>
                              <td><%=rs.getString(7) %></td>
                              <td>
                                 <%
                                    int ID_es =  rs.getInt(1);
                                    PreparedStatement set = con.prepareStatement("SELECT EL.nom FROM element EL join vacation V on V.id_ens=E.id join element EL on v.id_elem=EL.id WHERE v.id_ens=?");
                                    set.setInt(1 , ID_es);
                                    ResultSet rs1 = preparedStatement.executeQuery();
                                    	while(rs1.next()){
                                    		out.write(rs1.getString(1)+"<br/>");
                                    	}
                                    %>
                              </td>
                              <td class="text-center"><i  onclick="ModifyItem(<%=ID_es %>)" class="btn material-icons" data-toggle="modal" data-target="#UpdateEns">create</i></td>
                              <td class="text-center"><i  onclick="DeleteItem(<%=ID_es %>)" class="material-icons">delete</i></td>
                           </tr>
                           <%
                              }
                                  %>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>
         <footer class="footer text-center">
            All Rights Reserved by Ensias. Designed and Developed by <a
               href="https://www.PFA.com">PFA-Boubekri-Bouallal</a>.
         </footer>
      </div>
      <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
      <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
      <script src="../dist/js/app-style-switcher.js"></script>
      <script src="../dist/js/waves.js"></script>
      <script src="../dist/js/sidebarmenu.js"></script>
      <script src="../dist/js/custom.js"></script>
   </body>
</html>