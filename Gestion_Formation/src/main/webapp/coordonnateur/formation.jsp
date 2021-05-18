<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.pfa.connectionProvide.*" %>
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
                        <h4 class="page-title">Formations</h4>
                        <div class="d-flex align-items-center">
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal" id="AddFormation">
                <div class="modal-dialog">
                  <div class="modal-content">
                  
                    <!-- Modal Header -->
                    <div class="modal-header p-5 text-center bg-light">
                      <h4 class="modal-title mb-3">Ajouter Une Formation</h4>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                    <form class="form-horizontal form-material mx-3">
                        <div class="form-group ">
                            <label for="example-email" class="col-md-12 ">Nom</label>
                            <div class="col-sm-12">
                                <input type="email" placeholder=""
                                    class="form-control form-control-line" name="example-email"
                                    id="example-email">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6  py-2 center-block ">
                                    <button class="btn btn-success text-white col-12" onclick="addUser()">Ajouter</button>
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

            <div class="modal" id="UpdateFormation">
                <div class="modal-dialog">
                  <div class="modal-content">
                  
                    <div class="modal-header p-5 text-center bg-light">
                      <h4 class="modal-title mb-3">Modifier DonnÃ©es Etudiant</h4>
                    </div>
                    
                    <div class="modal-body">
                    <form class="form-horizontal form-material mx-3">
                        <div class="form-group ">
                            <div class="row align-content-between mx-3">
                                <div class="col-sm-6 p-l-0" >
                                    <label for="nom-prof" class="col-12">Nom</label>
                                    <input type="text" name="prenom-prof" id="prenom-prof" class="form-control form-control-line">
                                </div>
                                <div class="col-sm-6 p-r-0">
                                    <label for="prenom-prof" class="col-12">Prenom</label>
                                    <input name="prenom-prof" id="prenom-prof" type="text" class="form-control form-control-line">
                                </div>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="example-email" class="col-md-12 ">Email</label>
                            <div class="col-sm-12">
                                <input type="email" placeholder="nom@prenom.com"
                                    class="form-control form-control-line" name="example-email"
                                    id="example-email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-12 ">Genre</label>
                            <div class="col-sm-12">
                                <select class="form-select shadow-none form-control-line">
                                    <option>Homme</option>
                                    <option>Femme</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-12 ">Adresse</label>
                            <div class="col-sm-12">
                                <textarea class="form-control form-control-line" 
                                    rows="3"></textarea>
                            </div>
                          </div>
                        <div class="form-group">
                            <label class="col-sm-12 ">Niveau</label>
                            <div class="col-sm-12">
                                <select class="form-select shadow-none form-control-line">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-6  py-2 center-block ">
                                    <button class="btn btn-success text-white col-12" onclick="addUser()">Valider</button>
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

              <script>
                  function addUser(){
                      
                  }
              </script>
            <div class="container">
                    <ul class="nav nav-tabs">
                      <li class="active nav-item" role="presentation"><a data-toggle="tab" href="#u1">Formation 1</a></li>
                      <li class="nav-item" role="presentation"><a data-toggle="tab" href="#u2">Formation 2</a></li>
                      <li>
                          <div class="modal" id="AddUser">
                            <div class="modal-dialog">
                              <div class="modal-content">
                              
                                <!-- Modal Header -->
                                <div class="modal-header p-5 text-center bg-light">
                                  <h4 class="modal-title mb-3">Ajouter Un Formation</h4>
                                </div>
                                
                                <!-- Modal body -->
                                <div class="modal-body">
                                   <form class="form-horizontal form-material mx-2">
                                    <div class="form-group">
                                        <label class="col-md-12">Nom</label>
                                        <div class="col-md-12">
                                            <input type="text" placeholder="Johnathan Doe"
                                                class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">Email</label>
                                        <div class="col-md-12">
                                            <input type="email" placeholder="johnathan@admin.com"
                                                class="form-control form-control-line" name="example-email"
                                                id="example-email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Mot de passe</label>
                                        <div class="col-md-12">
                                            <input type="password" value="password"
                                                class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Phone No</label>
                                        <div class="col-md-12">
                                            <input type="text" placeholder="123 456 7890"
                                                class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Addresse</label>
                                        <div class="col-md-12">
                                            <input type="text" placeholder="123 456 7890"
                                                class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">Role</label>
                                        <div class="col-sm-12">
                                            <select class="form-select shadow-none form-control-line">
                                                <option></option>
                                                <option></option>
                                                <option></option>
                                                <option></option>
                                                <option></option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row col-sm-12">
                                            <button class="btn btn-success text-white">Ajouter</button>
                                        </div>
                                        <div class="row col-sm-12">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Quiter</button>
                                        </div>
                                    </div>
                                </form>
                                </div>                                
                              </div>
                            </div>
                          </div>
                        <div class="text-center">
                          <a href="" class="btn btn-primary mb-0" style="padding: 10px" data-toggle="modal" data-target="#AddFormation">Ajouter Formation</a>
                        </div>


                      </li>
                    </ul>

                    <div class="tab-content">
                      <div id="u1" class="tab-pane fade active" style="background-color: white;">
                        <div class="">
                          <div class="card  card-body">
                           <table class="my-table-bordred table-bordered col-12">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Nom</th>
                                        <th scope="col">Prenom</th>
                                        <th scope="col">Genre</th>
                                        <th scope="col">Adresse</th>
                                        <th  class="col-1" colspan=2><center>Action </center></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateFormation">create</i></td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateProf">delete</i></td>
                                    </tr>
                                    <tr>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateFormation">create</i></td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal">delete</i></td>
                                    </tr>
                                    <tr>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateFormation">create</i></td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" >delete</i></td>
                                    </tr>
                                </tbody>
                            </table>
                           </div>
                        </div>
                      </div>
                      <div id="u2" class="tab-pane fade" style="background-color: white;">
                        <div class="">
                           <div class="card" style="padding: 20px">
                               <table class="my-table-bordred table-bordered col-12">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Nom</th>
                                        <th scope="col">Prenom</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Adresse</th>
                                        <th  class="col-1" colspan=2><center>Action </center></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateProf">create</i></td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateProf">delete</i></td>
                                    </tr>
                                    <tr>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateProf">create</i></td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateProf">delete</i></td>
                                    </tr>
                                    <tr>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td>Cell</td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateStudnent">create</i></td>
                                        <td class="text-center"><i  href="" class="btn material-icons" data-toggle="modal" data-target="#UpdateStudnent">delete</i></td>
                                    </tr>
                                </tbody>
                            </table>
                           </div>
                        </div>
                      </div>
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
    $('.nav-tabs a[href="#u1"]').tab('show')
    $('.nav-tabs a').click(function(){
      $(this).tab('show');
    })
    $('.nav-tabs a:first').tab('show')
    $('.nav-tabs a:last').tab('show')
    $('.nav-tabs li:eq(2) a').tab('show')
    </script>
</body>

</html>