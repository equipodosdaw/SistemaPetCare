<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PetCare | Error-404</title>
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <%@ include file="vistas/layout/links.jsp"%>
    </head>
    <body class="sidebar-closed sidebar-collapse" style="height: auto;">

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Error 404
                </h1>
                <ol class="breadcrumb">
                    <li><a href="srvUsuario?accion=verificar"><i class="fa fa-dashboard"></i> Inicio</a></li>
                    <li class="active"><a href="#">Error 404</a></li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">

                <div class="error-page">
                    <h2 class="headline text-red">500</h2>

                    <div class="error-content">
                        <h3><i class="fa fa-warning text-red"></i>Oops! Algo salió mal</h3>

                        <p>
                            Trabajaremos para solucionarlo de inmediato.
                            Mientras tanto, puedes solucionarlo <a href="#"> -- </a>
                        </p>

                        <form class="search-form">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" placeholder="Search">

                                <div class="input-group-btn">
                                    <button type="submit" name="submit" class="btn btn-danger btn-flat"><i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.input-group -->
                        </form>
                    </div>
                </div>
                <!-- /.error-page -->

            </section>
            <!-- /.content -->
        </div>
        <%@ include file="vistas/layout/scripts.jsp"%>

    </body>
</html>
