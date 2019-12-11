<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManagement.aspx.cs" Inherits="RmSystemWeb.AdminManagement" %>

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
                        <img src="assets/images/users/1.png" alt="user" /></div>
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
                        <h3 class="text-themecolor">Gestionar Riesgos</h3>
                    </div>
                </div>
                <!-- ============================================================== -->
                <div class="card">
                    <ul class="nav nav-tabs customtab justify-content-end" role="tablist">
                        <li class="nav-item"><a class="nav-link disabled active" id="tab1" data-toggle="tab"
                            role="tab"><span class="hidden-sm-up"><i
                                class="fas fa-list"></i></span><span class="hidden-xs-down">Historial de proyectos</span></a>
                        </li>
                        <li class="nav-item"><a class="nav-link disabled" id="tab2" data-toggle="tab" role="tab"><span
                            class="hidden-sm-up"><i class="fas fa-code-branch"></i></span><span class="hidden-xs-down">Riesgos</span></a>
                        </li>
                        <li class="nav-item"><a class="nav-link disabled" id="tab3" data-toggle="tab" role="tab"><span
                            class="hidden-sm-up"><i class="fas fa-code-branch"></i></span><span class="hidden-xs-down">Identificar</span></a>
                        </li>
                        <li class="nav-item"><a class="nav-link disabled" id="tab4" data-toggle="tab" role="tab"><span
                            class="hidden-sm-up"><i class="fas fa-code-branch"></i></span><span class="hidden-xs-down">Analizar y Evaluar</span></a>
                        </li>
                        <li class="nav-item"><a class="nav-link disabled" id="tab5" data-toggle="tab" role="tab"><span
                            class="hidden-sm-up"><i class="fas fa-code-branch"></i></span><span class="hidden-xs-down">Tratar</span></a>
                        </li>
                        <li class="nav-item"><a class="nav-link disabled" id="tab6" data-toggle="tab" role="tab"><span
                            class="hidden-sm-up"><i class="fas fa-code-branch"></i></span><span class="hidden-xs-down">Implementar</span></a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_historial" role="tabpanel">
                            <div class="p-20">
                                <div class="row p-10">
                                    <h2>Proyectos </h2>
                                    <button class="btn btn-block btn-warning" type="button" title="Agregar proyecto"
                                        style="width: 40px;"
                                        data-toggle="modal" data-target="#modal_nuevo_proyecto">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                                <div class="row table-responsive p-20">
                                    <table id="tbl_proyectos"
                                        <%--class="display nowrap table table-hover table-striped table-bordered"--%>
                                        class="display nowrap table table-hover table-striped table-bordered"
                                        cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 80px;">Código</th>
                                                <th>Nombre de proyecto</th>
                                                <th style="width: 100px;">Fecha</th>
                                                <th style="width: 150px;">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        <div class="tab-pane" id="tab_riesgos" role="tabpanel">
                            <div class="p-20">
                                <div class="row">
                                    <div class="col col-2">
                                        <label>Código: </label>
                                        <label id="lblCodigoProyecto"></label>
                                    </div>
                                    <div class="col">
                                        <label>Proyecto: </label>
                                        <label id="lblNombreProyecto"></label>
                                    </div>
                                    <div class="col col-1">
                                        <div class="row" style="justify-content: flex-end; align-items: flex-end;">
                                            <button class="btn" type="button" title="Ir al historial"
                                                style="width: 40px; background-color: tomato; color: #FFFFFF;"
                                                onclick="goHistorial();">
                                                <i class="fas fa-arrow-left"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row p-10">
                                    <h2>Riesgos </h2>
                                    <button class="btn btn-warning" type="button" title="Agregar riesgo"
                                        style="width: 40px;"
                                        data-toggle="modal" data-target="#modal_nuevo_riesgo">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>

                                <div class="row table-responsive p-20">
                                    <table id="tbl_riesgos"
                                        class="display nowrap table table-hover table-striped table-bordered"
                                        cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 80px;">Código</th>
                                                <th style="width: 100px;">Tipo de riesgo</th>
                                                <th>Nombre de riesgo</th>
                                                <th>Estado</th>
                                                <th>Acciones</th>
                                                <th style="width: 180px;">Pasos</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_identificar" role="tabpanel">
                            <div class="p-20">
                                <div class="row">
                                    <div class="col col-2">
                                        <label>Código: </label>
                                        <label id="lblCodigoRiesgo"></label>
                                    </div>
                                    <div class="col">
                                        <label>Riesgo: </label>
                                        <label id="lblNombreRiesgo"></label>
                                    </div>
                                    <div class="col col-2">
                                        <div class="row" style="justify-content: flex-end; align-items: flex-end;">
                                            <button class="btn btn-danger" type="button" title="Ir a riesgos"
                                                style="width: 40px;"
                                                onclick="goAgregarRiesgos();">
                                                <i class="fas fa-arrow-left"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row p-10">
                                    <h2>Causas </h2>
                                    <button class="btn btn-warning waves-effect waves-light" style="width: 40px;"
                                        title="Agregar causa"
                                        data-toggle="modal" data-target="#modal_nueva_causa">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>

                                <div class="row table-responsive p-20">

                                    <table id="tbl_causas"
                                        class="display nowrap table table-hover table-striped table-bordered"
                                        cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 80px;">Código</th>
                                                <th>Descripción</th>
                                                <th style="width: 80px;">Porcentaje (%)</th>
                                                <th>Tipo</th>
                                                <th style="width: 120px;">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_analizar" role="tabpanel">
                            <div class="p-20">
                                <div class="row">
                                    <div class="col col-2">
                                        <label>Código: </label>
                                        <label id="lblCodigoRiesgo2"></label>
                                    </div>
                                    <div class="col">
                                        <label>Riesgo: </label>
                                        <label id="lblNombreRiesgo2"></label>
                                    </div>
                                    <div class="col col-2">
                                        <div class="row" style="justify-content: flex-end; align-items: flex-end;">
                                            <button class="btn btn-danger" type="button" title="Ir a riesgos"
                                                style="width: 40px;"
                                                onclick="goAgregarRiesgos();">
                                                <i class="fas fa-arrow-left"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <div class="row p-10">
                                    <h2>Detalle de análisis </h2>
                                    <button class="btn btn-warning waves-effect waves-light" style="width: 40px;"
                                        title="Agregar detalle" id="btnOpenDetalle"
                                        <%--data-toggle="modal" data-target="#modal_agregar_detalle"--%>
                                        >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                    <label id="lblDetailId"></label>
                                </div>

                                <div class="row">
                                        <div class="col-sm-3 nopadding">
                                            <div class="form-group">
                                                <label>Impacto:</label>
                                            </div>
                                        </div>
                                        <div class="col nopadding">
                                            <div class="form-group">
                                                <label id="lblImpactoDetalle"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3 nopadding">
                                            <div class="form-group">
                                                <label>Probabilidad:</label>
                                            </div>
                                        </div>
                                        <div class="col nopadding">
                                            <div class="form-group">
                                                <label id="lblProbabilidadDetalle"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3 nopadding">
                                            <div class="form-group">
                                                <label>Severidad:</label>
                                            </div>
                                        </div>
                                        <div class="col nopadding">
                                            <div class="form-group">
                                                <label id="lblSeveridadDetalle"></label>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_tratar" role="tabpanel">
                            <div class="p-20">
                                <div class="row">
                                    <div class="col col-2">
                                        <label>Código: </label>
                                        <label id="lblCodigoRiesgo3"></label>
                                    </div>
                                    <div class="col">
                                        <label>Riesgo: </label>
                                        <label id="lblNombreRiesgo3"></label>
                                    </div>
                                    <div class="col col-2">
                                        <div class="row" style="justify-content: flex-end; align-items: flex-end;">
                                            <button class="btn btn-danger" type="button" title="Ir a riesgos"
                                                style="width: 40px;"
                                                onclick="goAgregarRiesgos();">
                                                <i class="fas fa-arrow-left"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row p-10">
                                    <h2>Tratamiento </h2>
                                    <button class="btn btn-warning waves-effect waves-light" style="width: 40px;"
                                        title="Agregar detalle" id="btnOpenTratamiento"
                                        >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>

                                <div class="row">
                                    <div class="col-sm-3 nopadding">
                                        <div class="form-group">
                                            <label>Nombre del control:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblNombreControlTrat"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 nopadding">
                                        <div class="form-group">
                                            <label>Persona encargada:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblPersonaNombreTrat"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 nopadding">
                                        <div class="form-group">
                                            <label>Descripción del tratamiento:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblDescripcionTrat"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 nopadding">
                                        <div class="form-group">
                                            <label>Respuesta al riesgo:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblRespuestaTrat"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_implementar" role="tabpanel">
                            <div class="p-20">
                                <div class="row">
                                    <div class="col col-2">
                                        <label>Código: </label>
                                        <label id="lblCodigoRiesgo4"></label>
                                    </div>
                                    <div class="col">
                                        <label>Riesgo: </label>
                                        <label id="lblNombreRiesgo4"></label>
                                    </div>
                                    <div class="col col-2">
                                        <div class="row" style="justify-content: flex-end; align-items: flex-end;">
                                            <button class="btn btn-danger" type="button" title="Ir a riesgos"
                                                style="width: 40px;"
                                                onclick="goAgregarRiesgos();">
                                                <i class="fas fa-arrow-left"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <h2>Implementación</h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 nopadding">
                                        <div class="form-group">
                                            <label>Nombre del control:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblNombreControl"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 nopadding">
                                        <div class="form-group">
                                            <label>Persona encargada:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblPersonaEncargada"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 nopadding">
                                        <div class="form-group">
                                            <label>Descripción del tratamiento:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblDescripcionTratamiento"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 nopadding">
                                        <div class="form-group">
                                            <label>Respuesta al riesgo:</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-7 nopadding">
                                        <div class="form-group">
                                            <label id="lblRespuestaRiesgo"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 nopadding">
                                        <div class="form-group">
                                            <button type="button" class="btn btn-info waves-effect" data-dismiss="modal" id="btnSaveImplementar">
                                                Implementado
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <form runat="server">
                    <div id="modal_nuevo_proyecto" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Nuevo proyecto</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Nombre de proyecto:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Ingrese nombre de proyecto" ID="txtProjectName" />
                                                <%--<input type="" class="form-control" placeholder="Ingrese nombre de proyecto">--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <%--<asp:Button Text="Guardar" CssClass="btn btn-info" data-dismiss="modal" runat="server" ID="btnSave" OnClick="btnSave_Click" />--%>
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveProject">
                                        Guardar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_editar_proyecto" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Nuevo proyecto</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Código de proyecto:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <label id="lblProyectoIdModal"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Nombre de proyecto:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Ingrese nombre de proyecto" ID="txtNombreProyectoModal" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <%--<asp:Button Text="Guardar" CssClass="btn btn-info" data-dismiss="modal" runat="server" ID="btnSave" OnClick="btnSave_Click" />--%>
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveProjectEditado">
                                        Guardar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_agregar_detalle" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Detalle de análisis</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-3 nopadding">
                                            <div class="form-group">
                                                <label>Impacto:</label>
                                            </div>
                                        </div>
                                        <div class="col nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlImpacto">
                                                    <option value="1">Menor</option>
                                                    <option value="2">Moderado</option>
                                                    <option value="3">Mayor</option>
                                                    <option value="4">Catastrófico</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3 nopadding">
                                            <div class="form-group">
                                                <label>Probabilidad:</label>
                                            </div>
                                        </div>
                                        <div class="col nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlProbabilidad">
                                                    <option value="1">Excepcional</option>
                                                    <option value="2">Poco frecuente</option>
                                                    <option value="3">Frecuente</option>
                                                    <option value="4">Muy frecuente</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3 nopadding">
                                            <div class="form-group">
                                                <label>Severidad:</label>
                                            </div>
                                        </div>
                                        <div class="col nopadding">
                                            <div class="form-group">
                                                <strong>
                                                    <label id="lblTipoRiesgo" style="color: green;">Bajo</label></strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveDetail">
                                                Guardar
                                            </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_agregar_tratamiento" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Tratamiento</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Nombre del control:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control" id="txtNombreControl"
                                                    placeholder="Ingrese nombre del control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Persona encargada:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-2 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control" id="txtPersonaEncargada"
                                                    disabled>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control" id="txtPersonaEncargadaNombre"
                                                    disabled>
                                            </div>
                                        </div>
                                        <div class="col-sm-1 nopadding">
                                            <button class="btn" type="button" title="Ver colaboradores"
                                                style="width: 40px; background-color: tomato; color: #FFFFFF;"
                                                id="btnListUsers">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Descripción del tratamiento:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <textarea class="form-control" rows="5" placeholder="Ingrese descripción detallada del tratamiento" id="txtDescripcionTratamiento"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Respuesta al riesgo:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlRespuestaRiesgo">
                                                    <option value="1">Aceptar</option>
                                                    <option value="2">Evitar</option>
                                                    <option value="3">Reducir</option>
                                                    <option value="4">Transferir</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info waves-effect" data-dismiss="modal" id="btnSaveTreatment">
                                        Guardar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_nuevo_riesgo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Nuevo riesgo</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Tipo de riesgo:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlTipoRiesgo">
                                                    <option value="1">Operativo</option>
                                                    <option value="2">Logístico</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Nombre de riesgo:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control" placeholder="Ingrese nombre de riesgo" id="txtRiskName">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveRisk">
                                        Guardar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_editar_riesgo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Editar riesgo</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Código de riesgo:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <label id="lblCodigoRiesgoModal"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Tipo de riesgo:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlTipoRiesgoModal">
                                                    <option value="1">Operativo</option>
                                                    <option value="2">Logístico</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Nombre de riesgo:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control" placeholder="Ingrese nombre de riesgo" id="txtRiskNameModal">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveRiskEditado">
                                        Guardar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_nueva_causa" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Nueva Causa</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Descripción:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control"
                                                    placeholder="Ingrese descripción de causa" id="txtDescripcionCausa">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Porcentaje:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <input type="Numeric" class="form-control" placeholder="Ingrese del 1-100" id="txtPorcentaje">
                                            </div>
                                        </div>
                                        <div class="col-sm-2 nopadding">
                                            <div class="form-group">
                                                <label>%</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Tipo:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlTipoCausa">
                                                    <option value="1">Interno</option>
                                                    <option value="2">Externo</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveCause">
                                        Guardar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_editar_causa" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Nueva Causa</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Código de causa:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <label id="lblCausaId"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Descripción:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control"
                                                    placeholder="Ingrese descripción de causa" id="txtDescripcionCausaModal">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Porcentaje:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <input type="Numeric" class="form-control" placeholder="Ingrese del 1-100" id="txtPorcentajeModal">
                                            </div>
                                        </div>
                                        <div class="col-sm-2 nopadding">
                                            <div class="form-group">
                                                <label>%</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Tipo:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlTipoCausaModal">
                                                    <option value="1">Interno</option>
                                                    <option value="2">Externo</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveCauseEditado">
                                        Guardar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_consecuencias" class="modal fade" tabindex="-1" role="dialog"
                        aria-labelledby="vcenter" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Consecuencias</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <label>Código Causa: </label>
                                    <label id="lblCauseId"></label>
                                    <div class="row table-responsive p-20">

                                        <table id="tbl_consecuencias"
                                            class="display nowrap table table-hover table-striped table-bordered"
                                            cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th style="width: 80px;">Código</th>
                                                    <th>Descripción</th>
                                                    <th style="width: 80px;">Tipo</th>
                                                    <th style="width: 80px;">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                    <button class="btn btn-warning waves-effect waves-light" style="width: 40px;"
                                        title="Agregar consecuencia" id="btnOpenAgregarConsecuencia">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                    <%--<label>Código Causa: </label>
                            <label id="lblCauseId"></label>
                            <table id="tbl_consecuencias"
                                   class="display nowrap table table-hover table-striped table-bordered table-responsive" cellspacing="0"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Descripción</th>
                                    <th>Tipo</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <div class="row p-20">
                                <button class="btn btn-warning waves-effect waves-light" style="width: 40px;"
                                        title="Agregar consecuencia" id="btnOpenAgregarConsecuencia">
                                    <i class="fas fa-plus"></i></button>
                            </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_users" class="modal fade" tabindex="-1" role="dialog"
                        aria-labelledby="vcenter" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Colaboradores</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row table-responsive p-20">

                                        <table id="tbl_users"
                                            class="display nowrap table table-hover table-striped table-bordered"
                                            cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th style="width: 80px;">Código</th>
                                                    <th>Usuario</th>
                                                    <th style="width: 80px;">Seleccionar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                    <%--<button class="btn btn-warning waves-effect waves-light" style="width: 40px;"
                                        title="Agregar consecuencia" id="btnOpenAgregarConsecuencia">
                                        <i class="fas fa-plus"></i>
                                    </button>--%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_nueva_consecuencia" class="modal fade" tabindex="-1" role="dialog"
                        aria-labelledby="vcenter" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" style="width: 400px;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Nueva Consecuencia</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Descripción:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control" id="txtDescription"
                                                    placeholder="Ingrese descripción">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Tipo:</label>
                                                <!-- aqui deben listarse los colaboradores -->
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlTipoConsecuencia">
                                                    <option value="1">Financiero</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveConsecuencia">
                                        Aceptar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_editar_consecuencia" class="modal fade" tabindex="-1" role="dialog"
                        aria-labelledby="vcenter" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" style="width: 400px;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Nueva Consecuencia</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Código:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <label id="lblEffectIdEditar"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Descripción:</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <input type="Text" class="form-control" id="txtDescriptionEditar"
                                                    placeholder="Ingrese descripción">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 nopadding">
                                            <div class="form-group">
                                                <label>Tipo:</label>
                                                <!-- aqui deben listarse los colaboradores -->
                                            </div>
                                        </div>
                                        <div class="col-sm-7 nopadding">
                                            <div class="form-group">
                                                <select class="form-control" id="ddlTipoConsecuenciaEditar">
                                                    <option value="1">Financiero</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info waves-effect" id="btnSaveConsecuenciaEditado">
                                        Aceptar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->

                    <div id="modal_alerta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #b21f2d;">
                                    <h4 class="modal-title" style="color: white;">Alerta</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <p>¿Está seguro que desea eliminar este registro?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">No</button>
                                    <button type="button" class="btn btn-success waves-effect waves-light" data-dismiss="modal">
                                        Si
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="modal_eliminar_proyecto" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #b21f2d;">
                                    <h4 class="modal-title" style="color: white;">Alerta</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body" style="align-content: center;">
                                    <label>Proyecto: </label>
                                    <label id="lblProyectoId"></label>
                                    <p>¿Está seguro que desea eliminar este registro?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">No</button>
                                    <button type="button" class="btn btn-success waves-effect waves-light" id="btnConfirmarEliminarProyecto">
                                        Si
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_eliminar_riesgo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #b21f2d;">
                                    <h4 class="modal-title" style="color: white;">Alerta</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body" style="align-content: center;">
                                    <label>Riesgo: </label>
                                    <label id="lblRiesgoId"></label>
                                    <p>¿Está seguro que desea eliminar este registro?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">No</button>
                                    <button type="button" class="btn btn-success waves-effect waves-light" id="btnConfirmarEliminarRiesgo">
                                        Si
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_eliminar_causa" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #b21f2d;">
                                    <h4 class="modal-title" style="color: white;">Alerta</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body" style="align-content: center;">
                                    <label>Causa: </label>
                                    <label id="lblCausaIdEliminar"></label>
                                    <p>¿Está seguro que desea eliminar este registro?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">No</button>
                                    <button type="button" class="btn btn-success waves-effect waves-light" id="btnConfirmarEliminarCausa">
                                        Si
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_eliminar_effect" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #b21f2d;">
                                    <h4 class="modal-title" style="color: white;">Alerta</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body" style="align-content: center;">
                                    <label>Consecuencia: </label>
                                    <label id="lblEffectIdEliminar"></label>
                                    <p>¿Está seguro que desea eliminar este registro?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">No</button>
                                    <button type="button" class="btn btn-success waves-effect waves-light" id="btnConfirmarEliminarEffect">
                                        Si
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="modal_informe" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="vcenter"
                        aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Informe</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body" id="HTMLtoPDF">
                                    <%--<div class="container">--%>
                                        <!-- LLENAR DATOS -->
                                    <%--</div>--%>
                                </div>
                                <div class="modal-footer">
                                    <%-- <a href="#" onclick="HTMLtoPDF()">Download PDF</a>--%>
                                    <button id="print" class="btn btn-info waves-effect">Descargar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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
    <script>

        function goHistorial() {
            $("#tab_historial").show();
            $("#tab_identificar").hide();
            $("#tab_analizar").hide();
            $("#tab_tratar").hide();
            $("#tab_riesgos").hide();
            $("#tab_implementar").hide();
            $(".nav .nav-tabs li").removeClass("active");

            $("#tab2").removeClass("active");
            $("#tab1").addClass("active");
            $("#tab3").removeClass("active");
            $("#tab4").removeClass("active");
            $("#tab5").removeClass("active");
            $("#tab6").removeClass("active");

            loadProjects();
        }
    </script>

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

    <script src="assets/plugins/moment/moment.js"></script>
    <script src="toPdf/printThis.js"></script>

    <script src="jscustom/Acause.js"></script>
    <script src="jscustom/Acharts.js"></script>
    <script src="jscustom/Adetail.js"></script>
    <script src="jscustom/Aeffect.js"></script>
    <script src="jscustom/Aimplement.js"></script>
    <script src="jscustom/Ainforme.js"></script>
    <script src="jscustom/Aproject.js"></script>
    <script src="jscustom/Arisk.js"></script>
    <script src="jscustom/Atreatment.js"></script>

</body>

</html>
