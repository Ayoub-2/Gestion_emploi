<!DOCTYPE html>
<html dir="admin" lang="en"  style="font-size: 17px">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="robots" content="noindex,nofollow">
    <title>PFA</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <link href="../assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="../dist/css/style.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
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
                        <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark"
                                href="javascript:void(0)"><i class="ti-search"></i></a>
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
                                <a class="dropdown-item" href="profile.jsp"><i class="ti-user m-r-5 m-l-5"></i>
                                    Profile</a>
                                <a class="dropdown-item" href=""><i class="ti-wallet m-r-5 m-l-5"></i>
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
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="index.jsp" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span
                                    class="hide-menu">Tableau de bord</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="profile.jsp" aria-expanded="false"><i
                                    class="mdi mdi-account-network"></i><span class="hide-menu">Profile</span></a></li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="users.jsp" aria-expanded="false"><i class="mdi mdi-face"></i><span
                                    class="hide-menu">Utilsateurs</span></a></li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                

                                href="roles.jsp" aria-expanded="false"><i class="mdi mdi-border-all"></i><span
                                    class="hide-menu">Roles</span></a></li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="report.jsp" aria-expanded="false"><i class="mdi mdi-alert-outline"></i><span
                                    class="hide-menu">Bug Report</span></a></li>
                    </ul>

                </nav>

            </div>
        </aside>
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-5">
                        <h4 class="page-title">Roles</h4>
                        <br>
                    </div>
                    <div class="col-7">
                        <ol >
                        <li class="my-2 my-lg-0 nav navbar-nav navbar-right">
                                      <a href="" class="btn btn-info mb-4" data-toggle="modal" data-target="#AddUser">Ajouter Role</a>
                        </li>
                    </ol>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                        <div class="modal" id="AddUser">
                            <div class="modal-dialog">
                              <div class="modal-content">
                              
                                <div class="modal-header p-5 text-center bg-light">
                                  <h4 class="modal-title mb-3">Ajouter Un Role</h4>
                                </div>
                                
                                <div class="modal-body">
                                   <form class="form-horizontal form-material mx-2">
                                    <div class="form-group">
                                        <label class="col-md-12">Designation</label>
                                        <div class="col-md-12">
                                            <input type="text" placeholder="Ex: Administrateur"
                                                class="form-control form-control-line">
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
                                
                                <div class="modal-footer">
                                </div>
                                
                              </div>
                            </div>
                          </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table v-middle">
                                    <thead>
                                        <tr class="bg-light">
                                            <th class="border-top-0">ID</th>
                                            <th class="border-top-0">Role</th>
                                            <th class="border-top-0">Designation</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16">1</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Admin</td>
                                            <td> Adminisateur du Platforme</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16">2</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Comptable</td>
                                            <td> Adminisateur du Platforme</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16">3</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Coordonateur</td>
                                            <td> Adminisateur du Platforme</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16">4</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>Coordonateur</td>
                                            <td> Adminisateur du Platforme</td>
                                        </tr>
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
    <script>
        $(".preloader").fadeOut();
    </script>
</body>

</html>