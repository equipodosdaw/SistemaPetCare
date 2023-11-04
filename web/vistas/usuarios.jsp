<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("admin") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PetCare | Usuarios</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition skin-blue sidebar-mini">

        <div class="wrapper">

            <%@ include file="../layout/header-admin.jsp"%>                  
            <%@ include file="../layout/aside-admin.jsp"%>

            <div class="content-wrapper">

                <section class="content-header">
                    <h1>
                        Administrar Usuarios
                        <small>Optional description</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Configuración</a></li>
                        <li class="active">Administrar Usuarios</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">Usuarios</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped dataTable table-hover display" id="tablaUsuarios">
                                    <thead>
                                        <tr>
                                            <th>IdUsuario</th>
                                            <th>Usuario</th>
                                            <th>Estado</th>
                                            <th>Perfil</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>

                                    <c:forEach var="user" items="${usuarios}" varStatus="iteracion">                                                    
                                        <tr>
                                            <td>${user.id_usuario}</td>
                                            <td>${user.nombreUsuario}</td>
                                            <c:if test="${user.estado == true}">
                                                <td><span class="badge bg-green active">Usuario Activo</span></td> 
                                            </c:if>
                                            <c:if test="${user.estado == false}">
                                                <td><span class="badge bg-red active">Usuario Inactivo</span></td> 
                                            </c:if>
                                            <td>${user.perfilUsuario.nombrePerfil}</td>
                                            <td><a href="<c:url value="srvUsuario">
                                                       <c:param name="accion" value="leerUsuario" />
                                                       <c:param name="cod" value="${user.id_usuario}" />
                                                   </c:url>"><button type="button" class="btn btn-warning" data-toggle="tooltip"  title="Editar" data-original-title="Editar">
                                                        <i class="fa fa-pencil"></i></button></a>
                                                <!-- DESACTIVAR / ACTIVAR USUARIOS -->
                                                <c:choose>
                                                    <c:when test="${user.estado == true}">
                                                        <input type="hidden" id="item" value="${user.id_usuario}">
                                                        <a id="desactivarUsuario" href="srvUsuario?accion=desactivarUsuario&cod=${user.id_usuario}" class="btn btn-danger"  data-toggle="tooltip" title="Desactivar" data-original-title="Desactivar">
                                                            <i class="fa fa-remove"></i></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <input type="hidden" id="item" value="${user.id_usuario}">
                                                        <a id="activarUsuario" href="srvUsuario?accion=activarUsuario&cod=${user.id_usuario}" class="btn btn-primary" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                            <i class="glyphicon glyphicon-ok"></i></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                <!-- ELIMINAR USUARIOS -->
                                                <input type="hidden" id="codigo" value="${user.id_usuario}">
                                                <a id="deleteUser" href="<c:url value="srvUsuario">
                                                       <c:param name="accion" value="eliminarUsuario" />
                                                       <c:param name="cod" value="${user.id_usuario}" />
                                                   </c:url>"><button type="button" class="btn btn-danger" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar">
                                                        <i class="fa fa-trash"></i></button></a>

                                            </td>
                                        </tr>                                                    
                                    </c:forEach>    
                                </table>
                            </div>
                        </div>
                    </div>
                </section>

            </div>

            <%@ include file="../layout/footer.jsp"%>

            <div class="control-sidebar-bg"></div>
        </div>

        <%@ include file="../layout/scripts.jsp"%>
        
    </body>
    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="swetalert/sweetalert.js" type="text/javascript"></script>
    <script src="js/funcionesUsuario.js" type="text/javascript"></script>
    
    <script>
        $(document).ready(function () {
            $('#tablaUsuarios').DataTable();
        });
    </script>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>
