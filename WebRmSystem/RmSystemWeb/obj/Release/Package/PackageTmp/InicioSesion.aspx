<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="RmSystemWeb.InicioSesion" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/logo-peque.png">
    <title>Iniciar Sesión</title>

    <link href="login/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="login/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link href="login/css/coming-soon.min.css" rel="stylesheet">
</head>

<body>

<img class="img-fluid mb-3 mb-lg-0" src="login/img/logo-gestion.jpg" alt="" id="imagen-fondo" />

<div class="masthead">
    <div class="masthead-bg"></div>
    <div class="container h-100">
        <div class="row h-100">
            <div class="col-12 my-auto">
                <form runat="server">
                <div class="masthead-content text-white py-5 py-md-0">
                    <div class="crop-img" id="div-logo-login" style="width:106.66px;">
                    </div>
                    <br />
                    <div class="form-group" style="text-align: center;">
                        <h5 style="color:white;">Inicie Sesión</h5>
                    </div>
                    <div class="input-group form-group">
                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Correo electrónico" ID="txtEmail"/>
                        <%--<input type="text" class="form-control" placeholder="Correo electrónico">--%>
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                    </div>
                    <div class="input-group form-group">
                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Contraseña" ID="txtPassword" type="Password"/>
                        <%--<input type="password" class="form-control" placeholder="Contraseña">--%>
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                    </div>
                    <div class="form-group" style="text-align: center; font-size:15px;">
                        <asp:Button Text="Ingresar" CssClass="btn btn-block" ID="btnIngresar" runat="server" style="background-color:#C8731A; color:white;" OnClick="btnIngresar_Click" />
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="login/vendor/jquery/jquery.min.js"></script>
<script src="login/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="login/js/coming-soon.min.js"></script>

</body>
</html>