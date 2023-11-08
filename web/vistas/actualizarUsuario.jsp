<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("admin") != null | session.getAttribute("cliente") != null) {
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
                        Actualizar Datos Usuario

                    </h1>
                    <div class="row">  

                        <div class="col-xs-12 col-md-3">
                        </div>
                        <div class="col-md-3 hidden-xs"></div>
                        <div class="col-xs-2 col-md-1">
                        </div>
                        
                        <c:if test="${admin.nombreUsuario != null}">
                        <div class="col-xs-10 col-md-5 ">
                            <div class="btn-group pull-right">
                                <a href="srvUsuario?accion=listarUsuarios" class="btn btn-default">
                                    <i class="fa fa-align-justify"></i> Ver listado</a>                                              
                            </div>
                        </div>
                        </c:if>
                    </div>
                </section>
                <section class="content">



                    <div class="box">


                        <div id="exTab2">	
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a  href="#1" data-toggle="tab">Cuenta</a>
                                </li>
                                <%
                                    if (session.getAttribute("admin") != null) {
                                %>

                                <li><a href="#2" data-toggle="tab">Veterinario</a>
                                </li>
                                <%
                                    }
                                %>



                                <!--<li><a href="#3" data-toggle="tab">Estadísticas</a>
                                </li>-->
                            </ul>

                            <div class="tab-content ">
                                <div class="tab-pane active" id="1">
                                    <div class="box-header with-border">
                                        <i class="fa fa-edit"></i> <h3 class="box-title">Información de cuenta</h3>  
                                    </div>
                                    <form action="srvUsuario?accion=actualizarUsuario" method="POST">
                                        <input type="hidden" name="hCodigo" value="${usuario.id_usuario}">
                                        <div class="box-body">

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">E-mail</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                    <input type="email" class="form-control" placeholder="" name="txtEmail" maxlength="10"
                                                           value="${usuario.email}">
                                                </div>
                                            </div>



                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Password</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                    <input type="password" class="form-control" placeholder="" name="txtClave" maxlength="10"
                                                           value="${usuario.clave}">
                                                </div>
                                            </div>



                                            <%
                                                if (session.getAttribute("admin") != null) {
                                            %>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Perfil de Usuario</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-tags"></i></span>
                                                    <select class="form-control"  name="cboCargo" autofocus=""  required="">
                                                        <option value="0">Seleccione un perfil de Usuario</option>
                                                        <c:forEach items="${perfilUsuarios}" var="perfil">
                                                            <option value="${perfil.codigo}"  
                                                                    <c:if test="${perfil.codigo == 
                                                                                  usuario.perfilUsuario.codigo}">
                                                                          selected
                                                                    </c:if>
                                                                    >${perfil.nombrePerfil}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>                                  
                                            </div>

                                            <%
                                                } else {

                                                }
                                            %>

                                            
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input 
                                                                <c:if test="${admin.nombreUsuario != null}">
                                                                    type="checkbox" 
                                                                </c:if>
                                                                <c:if test="${cliente.nombreUsuario != null}">
                                                                    type="hidden" 
                                                                </c:if>
                                                                    name="chkEstado" 
                                                                   <c:out value="${usuario.estado == false ?
                                                                                   'unchecked' : 'checked'}"
                                                                          default="" />>Activo
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="with-border">
                                                <i class="fa fa-edit"></i> <h3 class="box-title">Información personal</h3>  
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Nombre Usuario</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control" placeholder="" name="txtNombre" maxlength="15"
                                                           value="${usuario.nombreUsuario}">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Apellidos</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control" placeholder="" name="txtApellidos"
                                                           value="${usuario.apellidos}">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">DNI</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control" placeholder="" name="txtDni" maxlength="10"
                                                           value="${usuario.dni}">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Teléfono</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control" placeholder="" name="txtTelefono"
                                                           value="${usuario.telefono}">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Dirección</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control" placeholder="" name="txtDireccion"
                                                           value="${usuario.direccion}">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Código Postal</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <input type="text" class="form-control" placeholder="" name="txtCP" maxlength="5"
                                                           value="${usuario.cp}">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Provincia</label>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon"><i class="fa fa-tags"></i></span>
                                                    <select class="form-control"  name="txtProvincia" autofocus=""  required="">
                                                        <option value="0">Seleccione la provincia</option>
                                                        <c:forEach items="${listarProvincias}" var="provincias">
                                                            <option value="${provincias.id}"  
                                                                    <c:if test="${provincias.id == 
                                                                                  usuario.provincias.id}">
                                                                          selected
                                                                    </c:if>
                                                                    >${provincias.nombreProvincia}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>                                  
                                            </div>

                                            <!-- /.box-body -->
                                            <div class="box-footer">
                                                <button type="reset" class="btn btn-danger"><i class="fa fa-close red"></i> Cancelar</button>
                                                <button type="submit" name="btnRegistrar" value="Registrar" class="btn btn-success"><i class="fa fa-refresh"></i> Actualizar Usuario</button>

                                            </div>
                                            <!-- /.box-footer -->
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane" id="2">
                                <div class="box-header with-border">
                                    <i class="fa fa-edit"></i> <h3 class="box-title">Información de cuenta</h3>  
                                </div>
                                <form action="srvUsuario?accion=actualizarUsuario" method="POST">
                                    <input type="hidden" name="hCodigo" value="${usuario.id_usuario}">
                                    <div class="box-body">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">E-mail</label>
                                            <div class="col-sm-4 input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                <input type="email" class="form-control" placeholder="" name="txtEmail" maxlength="10"
                                                       value="${usuario.email}">
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Password</label>
                                            <div class="col-sm-4 input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                <input type="password" class="form-control" placeholder="" name="txtClave" maxlength="10"
                                                       value="${usuario.clave}">
                                            </div>
                                        </div>

                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                            <button type="reset" class="btn btn-danger"><i class="fa fa-close red"></i> Cancelar</button>
                                            <button type="submit" name="btnRegistrar" value="Registrar" class="btn btn-success"><i class="fa fa-refresh"></i> Actualizar Usuario</button>

                                        </div>
                                        <!-- /.box-footer -->
                                </form>
                            </div>
                            </div>
                            <div class="tab-pane" id="3">
                                <h3>Add Estadísticas</h3>
                            </div>
                        </div>
                    </div>



            </div>
        </section> 

    </div>

    <%@ include file="../layout/footer.jsp"%>

    <div class="control-sidebar-bg"></div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<%@ include file="../layout/scripts.jsp"%>

</body>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>
