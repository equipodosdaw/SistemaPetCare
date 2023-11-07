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
                    <div class="row">
                        <div class="col-xs-12 col-md-3"></div>
                        <div class="col-md-3 hidden-xs"></div>
                        <div class="col-xs-2 col-md-1"></div>
                        <div class="col-xs-10 col-md-5">
                            <div class="btn-group pull-right">
                                <a href="srvMascota?accion=listasMascotas" class="btn btn-default">
                                    <i class="fa fa-align-justify"></i>Ver listado
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="box">
                        <div class="box-header with-border">
                            <i class="fa fa-edit"></i> <h3 class="box-title">Registrar Nueva Mascota</h3>
                        </div>
                        <form class="form-horizontal" action="srvMascota?accion=registrarMascota" method="POST">

                            <div class="box-body">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Nombre Mascota</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Nombre de la mascota" name="txtNombre" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Sexo</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Macho o Hembra" name="txtSexo" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Raza</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ej: Collie" name="txtRaza" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Especie</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ej: Perro" name="txtEspecie" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Nº MicroChip</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ej: 234358876ND" name="txtMicroChip" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Esterilizada</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ej: S o N" name="txtEsterilizada" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Peso en kg</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ej: 9.5" name="txtPeso" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Color</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ej: Negro" name="txtColor" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Cliente</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <select class="form-control" name="Cliente" autofocus="" required="">
                                            <option value="0">Seleccione el Cliente</option>
                                            <c:forEach items="${usuarios}" var="user">
                                                <option value="${user.dni}"  
                                                        <c:if test="${user.dni == 
                                                                      mascotas.usuario.dni}">
                                                              selected
                                                        </c:if>
                                                        >${user.dni}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                            </div>

                            <div class="box-footer">
                                <button type="reset" class="btn btn-danger"><i class="fa fa-close red"></i> Cancelar</button>
                                <button type="submit" name="btnRegistrar" value="Registrar" class="btn btn-success"><i class="fa fa-refresh"></i> Agregar Mascota</button>

                            </div>


                        </form>
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
