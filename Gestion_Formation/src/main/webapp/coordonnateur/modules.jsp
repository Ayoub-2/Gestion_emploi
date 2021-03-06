<%@ page errorPage="error.jsp" %>  
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.pfa.connectionProvide.*" %>
<%
Connection con ;
PreparedStatement preparedStatement  , stat1, stat2;
ResultSet rs,rs1; %>
<%!
public String capitalise(String str) {
	String output = str.substring(0, 1).toUpperCase() + str.substring(1);
	return output;
}
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
<body onbeforeload="First()">
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
                            class="ti-menu ti-close"></i></a> </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav float-start me-auto">
                        <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search position-absolute">
                                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
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
                <div class="row align-items-center">
                    <div class="col-5">
                        <h4 class="page-title">Modules</h4>
                        <div class="d-flex align-items-center">
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal" id="AddModule">
                <div class="modal-dialog">
                  <div class="modal-content">
                  
                    <!-- Modal Header -->
                    <div class="modal-header p-5 text-center bg-light">
                      <h4 class="modal-title mb-3">Ajouter Un Module</h4>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                    <form class="form-horizontal form-material mx-3" action="./add" method="post">
                    <input type="hidden" name="action" value="6">
                        <div class="form-group ">
                            <label for="NomMod" class="col-md-12 ">Nom</label>
                            <div class="col-sm-12">
                                <input type="text" placeholder=""
                                    class="form-control form-control-line" name="nom"
                                    id="NomMod">
                            </div>
                        </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Formation</label>
                              <div class="col-sm-12">
                                 <select class="form-select shadow-none form-control-line" name="id_formation">

                                <%
                                con = (new ConnectionProvider()).getConnection();
                           		preparedStatement = con.prepareStatement("SELECT * FROM formation ");
                           		rs = preparedStatement.executeQuery();
                                while (rs.next()) {
                                %>
                                    <option value="<%=rs.getInt(1) %>"><%=capitalise(rs.getString(2)) %></option>
                                   <%} %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6  py-2 center-block ">
                                    <button class="btn btn-success text-white col-12" type="submit">Ajouter</button>
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

            <div class="modal" id="AddElement">
                <div class="modal-dialog">
                  <div class="modal-content">
                  
                    <!-- Modal Header -->
                    <div class="modal-header p-5 text-center bg-light">
                      <h4 class="modal-title mb-3">Ajouter Un Element</h4>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                    <form class="form-horizontal form-material mx-3" action="./add" method="post">
                    <input type="hidden" name="action" value="7">
                        <div class="form-group ">
                            <label for="NomElement" class="col-md-12 ">Nom</label>
                            <div class="col-sm-12">
                                <input type="text" placeholder=""
                                    class="form-control form-control-line" name="nom"
                                    id="NomEmail">
                            </div>
                        </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Enseignant</label>
                              <div class="col-sm-12">
                                 <select class="form-select shadow-none form-control-line" name="id_ens">

                                <%
                                con = (new ConnectionProvider()).getConnection();
                           		preparedStatement = con.prepareStatement("SELECT id,nom,prenom FROM enseignant ");
                           		rs = preparedStatement.executeQuery();
                                while (rs.next()) {
                                %>
                                    <option value="<%=rs.getInt(1) %>"><%=capitalise(rs.getString(2))+ " " +capitalise(rs.getString(3)) %></option>
                                   <%} %>
                                </select>
                            </div>
                        </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Module</label>
                              <div class="col-sm-12">
                                 <select class="form-select shadow-none form-control-line" name="id_module">

                                <%
                                con = (new ConnectionProvider()).getConnection();
                           		preparedStatement = con.prepareStatement("SELECT id , nom FROM module ");
                           		rs = preparedStatement.executeQuery();
                                while (rs.next()) {
                                %>
                                    <option value="<%=rs.getInt(1) %>"><%=capitalise(rs.getString(2)) %></option>
                                   <%} %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6  py-2 center-block ">
                                    <button class="btn btn-success text-white col-12" type="submit">Ajouter</button>
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

            <div class="modal" id="UpdateModule">
                <div class="modal-dialog">
                  <div class="modal-content">
                  
                    <div class="modal-header p-5 text-center bg-light">
                      <h4 class="modal-title mb-3">Modifier Module</h4>
                    </div>
                    
                    <div class="modal-body">
                    <form class="form-horizontal form-material mx-3" action="./modify" method="post">
                    <input type="hidden" name="action" value="6">
                    <input type="hidden" name="id_module" id="id_module" value="">
                        <div class="form-group ">
                            <label for="NomMod" class="col-md-12 ">Nom</label>
                            <div class="col-sm-12">
                                <input type="text" placeholder=""
                                    class="form-control form-control-line" name="nom"
                                    id="NomMod">
                            </div>
                        </div>
                           <div class="form-group">
                              <label class="col-sm-12 ">Formation</label>
                              <div class="col-sm-12">
                                 <select class="form-select shadow-none form-control-line" name="id_formation">

                                <%
                                con = (new ConnectionProvider()).getConnection();
                           		preparedStatement = con.prepareStatement("SELECT * FROM formation ");
                           		rs = preparedStatement.executeQuery();
                                while (rs.next()) {
                                %>
                                    <option value="<%=rs.getInt(1) %>"><%=capitalise(rs.getString(2)) %></option>
                                   <%} %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6  py-2 center-block ">
                                    <button class="btn btn-success text-white col-12" type="submit">Modifier</button>
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
            <form action="./delete" id="delete" method="post">
               <input type="hidden" name="action" value="6" >
               <input type="hidden" name="del_id" id="del_id" value="">
               <button type="submit" style="display: none;"></button>
            </form>
              <script>
              function ModifyItem(id){
                  document.getElementById('id_module').value = id;
               }
              function DeleteItem(id) {
               document.getElementById('del_id').value = id;
               document.getElementById('delete').submit();
              }
              </script>
            <div class="container">
                    <ul class="nav nav-tabs">
 <%
				int i = 0 ;
                con = (new ConnectionProvider()).getConnection();
           		preparedStatement = con.prepareStatement("SELECT * FROM formation ");
           		rs = preparedStatement.executeQuery();
                while (rs.next()) {
 %>
                      <li class="<%=i==0?"active":"" %> nav-item" role="presentation"><a data-toggle="tab" href="#u<%=rs.getInt(1)%>" id="<%=++i%>"><%=rs.getString(2) %></a></li><%} %>
                      <li>
                        <div class="text-center">
                          <a href="" class="btn btn-primary mb-0" style="padding: 10px" data-toggle="modal" data-target="#AddElement">Ajouter Element</a>
                        </div>

                      </li>
                      <li>
                          
                        <div class="text-center">
                          <a href="" class="btn btn-primary mb-0" style="padding: 10px" data-toggle="modal" data-target="#AddModule">Ajouter Module</a>
                        </div>

                      </li>
                    </ul>

                    <div class="tab-content">
<%
        			stat2 = con.prepareStatement("SELECT id from formation");
        			rs = stat2.executeQuery();;
                    while (rs.next()) {
                    %>
                      <div id="u<%=rs.getInt(1)%>" class="tab-pane fade active" style="background-color: white;">
                        <div class="">
                          <div class="card  card-body">
                           <table class="my-table-bordred table-bordered col-12">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Nom</th>
                                        <th scope="col">Element</th>
                                        <th scope="col">Professeur</th>
                                        <th  class="col-1" colspan=2><center>Action </center></th>
                                    </tr>
                                </thead>
                                <tbody>
	                                <%
	                                int j = 0 ;
	                    			stat1 = con.prepareStatement("SELECT M.id , M.nom FROM module M join  formation F on F.id=M.id_form where F.id=?");
	                                stat1.setInt(1,rs.getInt(1));
	                    			rs1 = stat1.executeQuery();
	                                while (rs1.next()) {
	                                %>
                                    <tr>
                                        <td><%=++j %></td>
                                        <td><%=rs1.getString(2) %></td>
			                              <td>
			                                 <%
			                                    int ID_mo =  rs1.getInt(1);    
			                                    PreparedStatement set = con.prepareStatement("SELECT nom FROM element EL where id_module=?");
			                                    set.setInt(1 , ID_mo);
			                                    ResultSet rs2 = set.executeQuery();
			                                    	while(rs2.next()){
			                                    		out.write(capitalise(rs2.getString(1))+"<br/>");

			                                    	}
			                                    set.close();
			                                    %>
			                              </td>
			                              			                              <td>
			                                 <%
			                                    set = con.prepareStatement("SELECT ES.nom,ES.prenom FROM enseignant ES join vacation V on V.id_ens=ES.id join element EL on v.id_elem=EL.id WHERE EL.id_module=?");
			                                    set.setInt(1 , ID_mo);
			                                    rs2 = set.executeQuery();
			                                    	while(rs2.next()){
			                                    		out.write(capitalise(rs2.getString(1))+" "+ capitalise(rs2.getString(2)) +"<br/>");
			                                    	}
			                                    %>
			                              </td>
                                        <td class="text-center"><i  href="" class="btn material-icons" onclick="ModifyItem(<%=rs1.getInt(1) %>)" data-toggle="modal" data-target="#UpdateModule">create</i></td>
                                        <td class="text-center"><i  href="" class="btn material-icons" onclick="DeleteItem(<%=rs1.getInt(1) %>)" data-toggle="modal">delete</i></td>
                                    </tr>
                                <%
                                }%>
                                    
                                </tbody>
                            </table>
                           </div>
                        </div>
                      </div>
<%
}%>

                    </div>
            </div>
        </div>
            <footer class="footer text-center">
                All Rights Reserved by Ensias. Designed and Developed by <a
                    href="https://www.PFA.com">PFA-Boubekri-Bouallal</a>.
            </footer>
        </div>
    </div>

    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../dist/js/app-style-switcher.js"></script>
    <script src="../dist/js/waves.js"></script>
    <script src="../dist/js/sidebarmenu.js"></script>
    <script src="../dist/js/custom.js"></script>
        <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../dist/js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="../dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../dist/js/custom.js"></script>
    <script type="text/javascript">
    document.getElementById('2').click();
    document.getElementById('1').click();

    </script>
</body>

</html>