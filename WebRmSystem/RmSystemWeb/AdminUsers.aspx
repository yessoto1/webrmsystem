<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="RmSystemWeb.AdminUsers" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>Pronet System SAC</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Vector CSS -->
    <link href="assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- You can change the theme colors from here -->
    <link href="css/colors/blue.css" id="theme" rel="stylesheet" />

    <link href="login/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <%--<link href="datatables/bootstrap/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="datatables/datatables/datatables.min.css" rel="stylesheet" />
    <link href="datatables/datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="datatables/main.css" rel="stylesheet" />
</head>

<body class="fix-header fix-sidebar card-no-border">
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
                        <b>
                            <img src="assets/images/rms-logo.PNG" class="light-logo" alt="homepage" />
                        </b>
                        <span>
                            <img src="assets/images/rms-letra.PNG" class="light-logo" alt="homepage" />
                        </span>
                    </a>
                </div>
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- ============================================================== -->
                        <li class="nav-item"><a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark"
                            href="javascript:void(0)"><i class="fas fa-bars"></i></a></li>
                        <li class="nav-item"><a
                            class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark"
                            href="javascript:void(0)"><i class="fas fa-bars"></i></a></li>
                        <!-- ============================================================== -->
                    </ul>
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href=""
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img
                                    src="assets/images/users/1.png" alt="user" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right scale-up">
                                <ul class="dropdown-user">
                                    <li><a href="#"><i class="fas fa-user"></i>Mi Perfil</a></li>
                                    <li><a href="InicioSesion.aspx"><i class="fas fa-power-off"></i>Cerrar Sesión</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <aside class="left-sidebar">
            <!-- ============================================================== -->
            <div class="scroll-sidebar">
                <div class="user-profile" style="background: url(assets/images/background/user-info.jpg) no-repeat;">
                    <div class="profile-img">
                        <img src="assets/images/users/1.png" alt="user" />
                    </div>
                    <div class="profile-text" style="align-content: center; text-align: center; background-color: #009C4F;">
                        <asp:Label CssClass="align-content-center" ForeColor="White"
                            Text="" ID="lblUserName" runat="server" />
                    </div>
                </div>
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-small-cap">OPCIONES</li>
                        <li><a class="has-arrow waves-effect waves-dark" aria-expanded="false" href="AdminReportes.aspx">
                            <i class="fas fa-chart-line"></i><span class="hide-menu">Reportes</span></a>
                           
                        </li>
                        <li><a class="has-arrow waves-effect waves-dark" href="AdminManagement.aspx" aria-expanded="false">
                            <i class="fas fa-search"></i><span class="hide-menu">Gestionar</span></a>
                        </li>
                        <li><a class="has-arrow waves-effect waves-dark" aria-expanded="false">
                            <i class="fas fa-cogs"></i><span class="hide-menu">Configuración</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="AdminUsers.aspx">Gestión de usuarios</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="sidebar-footer">
                <a href="InicioSesion.aspx"><i class="fas fa-power-off"></i>Cerrar Sesión</a>
            </div>
        </aside>
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor">Configuración</h3>
                    </div>
                </div>
                <!-- ============================================================== -->
                <div class="card">
                    <ul class="nav nav-tabs customtab justify-content-end" role="tablist">
                        <li class="nav-item"><a class="nav-link disabled active" id="tab1" data-toggle="tab"
                            role="tab"><span class="hidden-sm-up"><i
                                class="fas fa-list"></i></span><span class="hidden-xs-down">Lista</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_usuarios" role="tabpanel">
                            <div class="p-20">
                                <div class="row p-10">
                                    <h2>Usuarios </h2>
                                    <button class="btn btn-block btn-warning" type="button" title="Agregar colaborador"
                                        style="width: 40px;"
                                        data-toggle="modal" data-target="#modal_nuevo_colaborador">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>

                                <div class="row table-responsive p-10">
                                    <table id="tbl_usuarios"
                                        class="display nowrap table table-hover table-striped table-bordered"
                                        cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width:80px;">Código</th>
                                                <th>Nombres y apellidos</th>
                                                <th>Correo electrónico</th>
                                                <th style="width:80px;">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="modal_nuevo_colaborador" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Nuevo usuario</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Nombres:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <input type="" class="form-control" placeholder="Ingrese nombres" id="txtFirstName">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Apellidos:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <input type="" class="form-control" placeholder="Ingrese apellidos" id="txtLastName">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Correo electrónico:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <input type="" class="form-control" placeholder="Ingrese correo electrónico" id="txtEmailUser">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Contraseña:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Ingrese contraseña" id="txtPasswordUser">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info waves-effect" id="btnGuardarUsuario">
                                    Guardar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="modal_editar_colaborador" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Nuevo usuario</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Código Usuario:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblUserIdModal"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Nombres:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <input type="" class="form-control" placeholder="Ingrese nombres" id="txtFirstNameModal">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Apellidos:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <input type="" class="form-control" placeholder="Ingrese apellidos" id="txtLastNameModal">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Correo electrónico:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblCorreoModal"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <label>Contraseña:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Ingrese contraseña" id="txtPswModal">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info waves-effect" id="btnGuardarUsuarioEditado">
                                    Guardar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ============================================================== -->

                <div id="modal_eliminar_usuario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #b21f2d;">
                                <h4 class="modal-title" style="color: white;">Alerta</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body" style="align-content:center;">
                                <label>Usuario: </label><label id="lblIdUsuario"></label>
                                <p>¿Está seguro que desea eliminar este registro?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">No</button>
                                <button type="button" class="btn btn-success waves-effect waves-light" id="btnConfirmarEliminar">
                                    Si
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- ============================================================== -->
            <footer class="footer">
                ©
            </footer>
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->

    <script src="datatables/jquery/jquery-3.3.1.min.js"></script>
    <script src="datatables/popper/popper.min.js"></script>
    <script src="datatables/bootstrap/js/bootstrap.min.js"></script>
    <script src="datatables/datatables/datatables.min.js"></script>

    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>

    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <!-- ============================================================== -->
    <script src="assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="assets/plugins/vectormap/jquery-jvectormap-us-aea-en.js"></script>
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>

    <script src="jscustom/user.js"></script>

</body>

</html>