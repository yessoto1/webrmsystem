<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReportes.aspx.cs" Inherits="RmSystemWeb.AdminReportes" %>

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
    <!-- chartist CSS -->
    <link href="assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet" />
    <link href="assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet" />
    <link href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet" />
    <link href="assets/plugins/css-chart/css-chart.css" rel="stylesheet" />
    <!-- Vector CSS -->
    <link href="assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- You can change the theme colors from here -->
    <link href="css/colors/blue.css" id="theme" rel="stylesheet" />

    <link href="login/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <link href="assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
        rel="stylesheet" />
    <!-- Page plugins css -->
    <link href="assets/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet" />
    <!-- Color picker plugins css -->
    <link href="assets/plugins/jquery-asColorPicker-master/dist/css/asColorPicker.css" rel="stylesheet" />
    <!-- Date picker plugins css -->
    <link href="assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker plugins css -->
    <link href="assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet" />
    <link href="assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
    
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
                        <h3 class="text-themecolor">Reportes</h3>
                    </div>
                </div>
                <!-- ============================================================== -->
                <div class="card">
                    <ul class="nav nav-tabs customtab justify-content-end" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="tab1" data-toggle="tab" href="#reporte1"
                            role="tab"><span class="hidden-sm-up"><i
                                class="fas fa-list"></i></span><span class="hidden-xs-down">Riesgos</span></a>
                        </li>
                    </ul>
                    <%--<form runat="server">--%>
                        <div class="tab-content">
                            <div class="tab-pane active" id="reporte1" role="tabpanel">
                                <div class="p-20">
                                    <div class="row p-10">
                                        <div class="col-1">
                                            <label>Desde:</label>
                                        </div>
                                        <div class="col-2">
                                            <select class="form-control custom-select" id="ddlDesde">
                                                <option value="1">Enero</option>
                                                <option value="2">Febrero</option>
                                                <option value="3">Marzo</option>
                                                <option value="4">Abril</option>
                                                <option value="5">Mayo</option>
                                                <option value="6">Junio</option>
                                                <option value="7">Julio</option>
                                                <option value="8">Agosto</option>
                                                <option value="9">Septiembre</option>
                                                <option value="10">Octubre</option>
                                                <option value="11">Noviembre</option>
                                                <option value="12">Diciembre</option>
                                            </select>
                                        </div>
                                        <div class="col-1" style="text-align: center;">
                                            <label>Hasta</label>
                                        </div>
                                        <div class="col-2">
                                            <select class="form-control custom-select" id="ddlHasta">
                                                <option value="1">Enero</option>
                                                <option value="2">Febrero</option>
                                                <option value="3">Marzo</option>
                                                <option value="4">Abril</option>
                                                <option value="5">Mayo</option>
                                                <option value="6">Junio</option>
                                                <option value="7">Julio</option>
                                                <option value="8">Agosto</option>
                                                <option value="9">Septiembre</option>
                                                <option value="10">Octubre</option>
                                                <option value="11">Noviembre</option>
                                                <option value="12">Diciembre</option>
                                            </select>
                                        </div>
                                        <div class="col-2" style="text-align: center;">
                                            <button class="btn btn-block btn-warning" id="btnConsultarReporte" style="background-color: darkblue;">Consultar</button>
                                        </div>
                                    </div>
                                    <div class="row" id="sectionReportes">
                                        <div class="col-lg-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h4 class="card-title">Riesgos por Estado</h4>
                                                    <div>
                                                        <canvas id="chart2" height="150"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h4 class="card-title">Tipo de Riesgos</h4>
                                                    <div>
                                                        <canvas id="chart3" height="150"></canvas>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%--</form>--%>
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
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/plugins/popper/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--stickey kit -->
    <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Vector map JavaScript -->
    <script src="assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="assets/plugins/vectormap/jquery-jvectormap-us-aea-en.js"></script>
    <%--<script src="js/dashboard3.js"></script>--%>
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>

    <script src="EstiloNegro/vendor/datatables/jquery.dataTables.js"></script>
    <script src="EstiloNegro/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- ==============================para crear formularios================================ -->
    <script src="assets/plugins/dff/dff.js" type="text/javascript"></script>

    <script src="assets/plugins/moment/moment.js"></script>
    <script src="assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- Clock Plugin JavaScript -->
    <script src="assets/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
    <!-- Color Picker Plugin JavaScript -->
    <script src="assets/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
    <script src="assets/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <script src="assets/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="assets/plugins/daterangepicker/daterangepicker.js"></script>

    <script src="scripts/User.js"></script>

    <%--<script src="assets/plugins/Chart.js/chartjs.init.js"></script>--%>
    <script src="assets/plugins/Chart.js/Chart.min.js"></script>
    <script src="toPdf/printThis.js"></script>
    <script src="jscustom/Acharts.js"></script>


</body>

</html>