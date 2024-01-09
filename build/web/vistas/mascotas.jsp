<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("admin") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PetCare | Inicio</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <%@ include file="../layout/links.jsp"%>  
    </head>

    <body class="hold-transition skin-blue sidebar-mini">

        <div class="wrapper">

            <%@ include file="../layout/header-admin.jsp"%>                  
            <%@ include file="../layout/aside-admin.jsp"%>

            <div class="content-wrapper">

                <section class="content-header">
                    <h1>
                        Administrar Mascotas
                    </h1>
                </section>
                <section class="content-header">
                    <a href="srvMascota?accion=nuevaMascota" class="btn btn-success">
                        <i class="fa fa-plus"></i> Nueva Mascota
                    </a>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Configuración</a></li>
                        <li class="active">Administrar Mascotas</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">Mascotas</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped dataTable table-hover display" id="tablaMascotas">
                                    <thead>
                                        <tr>
                                            <th>IdMascota</th>
                                            <th>Nombre</th>
                                            <th>Estado</th>
                                            <th>Sexo</th>
                                            <th>Dni</th>
                                            <th>Nombre Usuario</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>

                                    <c:forEach var="masc" items="${mascotas}" varStatus="iteracion">                                                    
                                        <tr>
                                            <td>${masc.id_mascota}</td>
                                            <td>${masc.nombreMascota}</td>
                                            <c:if test="${masc.estado == true}">
                                                <td><span class="badge bg-green active">mascota Activa</span></td> 
                                            </c:if>
                                                <c:if test="${masc.estado == false}">
                                                <td><span class="badge bg-red active">Mascota Inactiva</span></td> 
                                            </c:if>
                                             <td>${masc.sexo}</td>
                                          <td>${masc.dni}</td>
                                            <td>${masc.usuario.nombreUsuario}</td>
                                            
                                             <td><a href="<c:url value="srvMascota">
                                                       <c:param name="accion" value="leerMascota" />
                                                       <c:param name="cod2" value="${masc.id_mascota}" />
                                                   </c:url>"><button type="button" class="btn btn-warning" data-toggle="tooltip"  title="Editar" data-original-title="Editar">
                                                        <i class="fa fa-pencil"></i></button></a>
                                                <!-- DESACTIVAR / ACTIVAR MASCOTA -->
                                               <c:choose>
                                                    <c:when test="${masc.estado == true}">
                                                        <input type="hidden" id="item" value="${masc.id_mascota}">
                                                        <a id="desactivarMascota" href="srvMascota?cambiar=desactivar&cod=${masc.id_mascota}" class="btn btn-danger"  data-toggle="tooltip" title="Desactivar" data-original-title="Desactivar">
                                                            <i class="fa fa-remove"></i></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <input type="hidden" id="item" value="${masc.id_mascota}">
                                                        <a id="activarMascota" href="srvMascota?cambiar=activar&cod=${masc.id_mascota}" class="btn btn-primary" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                            <i class="glyphicon glyphicon-eye-open"></i></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                               
                                                <!-- ELIMINAR MASCOTA -->
                                                
                                                  <input type="hidden" id="codigo" value="${masc.id_mascota}">
                                                <a id="deleteMascota" href="<c:url value="srvMascota">
                                                       <c:param name="accion" value="eliminarMascota" />
                                                       <c:param name="cod" value="${masc.id_mascota}" />
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
   <script src="js/funcionesAlert.js" type="text/javascript"></script>
    
    <script>
        $(document).ready(function () {
            $('#tablaMascotas').DataTable();
        });
    </script>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>
