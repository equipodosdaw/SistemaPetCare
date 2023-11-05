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
                        Detalles de Mascota

                    </h1>
                    <div class="row">  

                        <div class="col-xs-12 col-md-3">
                        </div>
                        <div class="col-md-3 hidden-xs"></div>
                        <div class="col-xs-2 col-md-1">
                        </div>
                        <div class="col-xs-10 col-md-5 ">
                            <div class="btn-group pull-right">
                                <a href="srvMascota?accion=listasMascotas" class="btn btn-default">
                                    <i class="fa fa-align-justify"></i> Ver listado</a>                                              
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">



                    <div class="box">


                        <div id="exTab2">	

                            <div class="tab-content ">
                                <div class="tab-pane active" id="1">

                                    <div class="row">
                                        <div class="col-md-3 col-12">
                                            <div class="row">
                                                <div class="small-12 medium-2 large-2 columns">
                                                    <div class="circle">
                                                        <img class="profile_pic"
                                                             src="https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg">
                                                        <div class="p-image">
                                                        <i class="fa fa-camera upload-button"></i>
                                                        <input class="file-upload" type="file" accept="image/*" />
                                                    </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-9 col-12">
                                            <div class="box-header with-border">
                                                <i class="fa fa-edit"></i> <h3 class="box-title">Información de la mascota</h3>  
                                            </div>
                                            <form action="srvMascota?accion=actualizarMascota" method="POST">
                                                <input type="hidden" name="hCodigo" value="${mascotas.id_mascota }">
                                                <div class="box-body">

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">Nombre </label>
                                                        <div class="col-sm-4 input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                            <input type="text" class="form-control" placeholder="" name="txtNombre" maxlength="15"
                                                                   value="${mascotas.nombreMascota}">
                                                        </div>
                                                    </div>
                                                        
                                                        
                                                       <div class="form-group">
                                                        <label class="col-sm-2 control-label">Especie </label>
                                                        <div class="col-sm-4 input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                            <input type="text" class="form-control" placeholder="" name="txtEspecie" maxlength="15"
                                                                   value="${mascotas.especie}">
                                                        </div>
                                                    </div>
                                                        
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label">Raza </label>
                                                        <div class="col-sm-4 input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                            <input type="text" class="form-control" placeholder="" name="txtRaza" maxlength="15"
                                                                   value="${mascotas.raza}">
                                                        </div>
                                                    </div>
                                                        
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label">Sexo </label>
                                                        <div class="col-sm-4 input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                            <input type="text" class="form-control" placeholder="" name="txtSexo" maxlength="15"
                                                                   value="${mascotas.sexo}">
                                                        </div>
                                                    </div>
                                                        
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label">Fecha nacimiento </label>
                                                        <div class="col-sm-4 input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                            <input type="text" class="form-control" placeholder="" name="txtFechaN" maxlength="15"
                                                                   value="${mascotas.fecha_nacimiento}">
                                                        </div>
                                                    </div>
                                                        
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label">Peso </label>
                                                        <div class="col-sm-4 input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                            <input type="text" class="form-control" placeholder="" name="txtPeso" maxlength="15"
                                                                   value="${mascotas.peso}">
                                                        </div>
                                                    </div>
                                                        
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label">Color </label>
                                                        <div class="col-sm-4 input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                            <input type="text" class="form-control" placeholder="" name="txtColor" maxlength="15"
                                                                   value="${mascotas.color}">
                                                        </div>
                                                    </div>
                                                        
                                                        <div class="form-group">
                                                        <label class="col-sm-2 control-label">Nº Microchip </label>
                                                        <div class="col-sm-4 input-group">
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                            <input type="text" class="form-control" placeholder="" name="txtMicroChip" maxlength="15"
                                                                   value="${mascotas.microchip}">
                                                        </div>
                                                    </div>
                                                        
                                                         <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" name="chkEstado" 
                                                                   <c:out value="${mascotas.estado == false ?
                                                                                   'unchecked' : 'checked'}"
                                                                          default="" />>Activo
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                                    <!-- /.box-body -->
                                                    <div class="box-footer">
                                                        <button type="reset" class="btn btn-danger"><i class="fa fa-close red"></i> Cancelar</button>
                                                        <button type="submit" name="btnRegistrar" value="Registrar" class="btn btn-success"><i class="fa fa-refresh"></i> Actualizar Mascota</button>

                                                    </div>
                                                    <!-- /.box-footer -->
                                            </form>
                                        </div>
                                    </div>
                                </div>




                            </div>

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


<script>
    
    $(document).ready(function () {


    var readURL = function (input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.profile_pic').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }


    $(".file-upload").on('change', function () {
        readURL(this);
    });

    $(".upload-button").on('click', function () {
        $(".file-upload").click();
    });
});
    
    </script>
