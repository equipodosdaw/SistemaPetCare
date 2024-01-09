




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("admin") != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>PetCare | Citas</title>
        <%@ include file="../layout/links.jsp"%> 
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script> 
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <div class="wrapper">

            <%@ include file="../layout/header-admin.jsp"%>                  
            <%@ include file="../layout/aside-admin.jsp"%>

            <div class="content-wrapper">
                
                <!--Contenedor calendario-->
                <div id='calendar'></div>

                <!--Modal añadir cita-->
                <div class="modal fade" id="guardarCitaModal" tabindex="-1" role="dialog" aria-labelledby="titleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form class="form-horizontal" action="SrvCalendar?action=guardarCita" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="titleModalLabel"><i class="fa fa-edit" aria-hidden="true"></i> Reserva de cita</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="mascota" class="col-sm-3 control-label">Mascota:</label>
                                        <div class="col-sm-9">
                                            <select id="mascota" name="mascota" class="form-control" required>
                                                <c:forEach var="mascota" items="${mascotas}">
                                                    <option value="${mascota.id_mascota}">${mascota.nombreMascota}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="motivo" class="col-sm-3 control-label">Motivo:</label>
                                        <div class="col-sm-9">
                                            <textarea id="motivo" name="motivo" class="form-control" rows="4" cols="50" required></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="fecha" class="col-sm-3 control-label">Día:</label>
                                        <div class="col-sm-9">
                                            <input type="date" id="fecha" name="fecha" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="hora" class="col-sm-3 control-label">Hora:</label>
                                        <div class="col-sm-9">
                                            <input type="time" id="hora" name="hora" class="form-control" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="cif_centro" class="col-sm-3 control-label">Centro veterinario:</label>
                                        <div class="col-sm-9">
                                            <select id="cif_centro" name="cif_centro" class="form-control" required>
                                                <c:forEach var="centro" items="${centros}">
                                                    <option value="${centro.cif}">${centro.nombre}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-success">Guardar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!--Eliminar cita-->
                <div class="modal fade" id="eliminaCitaModal" tabindex="-1" role="dialog" aria-labelledby="citaModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form class="form-horizontal" action="SrvCalendar?action=eliminarCita" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="citaModalLabel">¿Deseas cancelar esta cita?</h4>
                                </div>
                                <div class="modal-body">
                                    <h4>Datos de la cita</h4>
                                    <p><i class="fa-solid fa-stethoscope" aria-hidden="true"></i> <strong>Motivo: </strong><span class="mostrarMotivo"></span></p>
                                    <p><i class="fa-solid fa-calendar-days" aria-hidden="true"></i> <strong>Fecha: </strong><span class="mostrarFecha"></span></p>
                                    <p><i class="fa-solid fa-clock" aria-hidden="true"></i> <strong>Hora: </strong><span class="mostrarHora"></span></p>
                                    <input type="hidden" id="id_cita" name="id_cita">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Volver</button>
                                    <button type="submit" class="btn btn-danger">Cancelar Cita</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                <!-- Modal eliminar/editar -->
                <div class="modal fade" id="editarEliminarCitaModal" tabindex="-1" role="dialog" aria-labelledby="citaModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="citaModalLabel">¿Qué quieres hacer con esta cita?</h4>
                            </div>
                            <div class="modal-body">
                                <h4>Datos de la cita</h4>
                                <p><i class="fa-solid fa-stethoscope" aria-hidden="true"></i> <strong>Motivo: </strong><span class="mostrarMotivo"></span></p>
                                <p><i class="fa-solid fa-calendar-days" aria-hidden="true"></i> <strong>Fecha: </strong><span class="mostrarFecha"></span></p>
                                <p><i class="fa-solid fa-clock" aria-hidden="true"></i> <strong>Hora: </strong><span class="mostrarHora"></span></p>
                                
                            </div>
                            <div id="mainModalFooter" class="modal-footer">
                                <button onclick="editarCita()" type="button" class="btn btn-default" >Editar cita</button>
                                <button onclick="eliminarCita()" type="button" class="btn btn-danger">Eliminar cita</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Modal editar -->
                <div class="modal fade" id="editarCitaModal" tabindex="-1" role="dialog" aria-labelledby="citaModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form class="form-horizontal" action="SrvCalendar?action=editarCita" method="post">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="titleModalLabel"><i class="fa fa-edit" aria-hidden="true"></i> Editar la cita</h4>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" id="id_citaEdit" name="id_cita_edit">
                                    <div class="form-group">
                                        <label for="mascota" class="col-sm-3 control-label">Mascota:</label>
                                        <div class="col-sm-9">
                                            <select id="mascotaEdit" name="mascota" class="form-control" required>
                                                <c:forEach var="mascota" items="${mascotas}">
                                                    <option value="${mascota.id_mascota}">${mascota.nombreMascota}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="motivo" class="col-sm-3 control-label">Motivo:</label>
                                        <div class="col-sm-9">
                                            <textarea id="motivoEdit" name="motivo" class="form-control" rows="4" cols="50" required></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="fecha" class="col-sm-3 control-label">Día:</label>
                                        <div class="col-sm-9">
                                            <input type="date" id="fechaEdit" name="fecha" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="hora" class="col-sm-3 control-label">Hora:</label>
                                        <div class="col-sm-9">
                                            <input type="time" id="horaEdit" name="hora" class="form-control" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="cif_centro" class="col-sm-3 control-label">Centro veterinario:</label>
                                        <div class="col-sm-9">
                                            <select id="cif_centroEdit" name="cif_centro" class="form-control" required>
                                                <c:forEach var="centro" items="${centros}">
                                                    <option value="${centro.cif}">${centro.nombre}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-success">Editar cita</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <script>
                    function editarCita(){
                        $('#editarEliminarCitaModal').modal('hide');
                        $('#editarCitaModal').modal('show');
                    }
                    function eliminarCita(){
                        $('#editarEliminarCitaModal').modal('hide');
                        $('#eliminaCitaModal').modal('show');
                    }
                    
                    document.addEventListener('DOMContentLoaded', function () {
                        var calendarEl = document.getElementById('calendar');
                        var calendar = new FullCalendar.Calendar(calendarEl, {
                            locale: 'es',
                            firstDay: 1,
                            initialView: 'dayGridMonth',
                            headerToolbar: {center: 'dayGridMonth,timeGridWeek'},
                            selectable: true,
                            eventSources: [{
                                    url: 'SrvCalendar', 
                                    method: 'GET', 
                                    extraParams: {
                                        action: 'listarCitas'  // Acción a realizar en el controlador
                                    },
                                    failure: function () {
                                        // Errores
                                    }
                                }],

                            dateClick: function (info) {
                                var fechaSeleccionada = info.dateStr;
                                document.getElementById('fecha').value = fechaSeleccionada;
                                $('#guardarCitaModal').modal('show');
                            },
                            
                            eventClick: function (info) {
                                var id_cita = info.event.id;
                                var motivo = info.event.title;
                                var extendedProps = info.event.extendedProps;
                                var mascota = extendedProps.mascota;
                                var centro = extendedProps.centro;
                                
                                var fechaCompleta = info.event.start;  
                                var fechaFormateada = new Date(fechaCompleta);
                                var year = fechaFormateada.getFullYear();
                                var month = ('0' + (fechaFormateada.getMonth() + 1)).slice(-2);
                                var day = ('0' + fechaFormateada.getDate()).slice(-2);
                                var fecha = year + '-' + month + '-' + day;
                                var hora = ('0' + fechaFormateada.getHours()).slice(-2) + ':' + ('0' + fechaFormateada.getMinutes()).slice(-2);
                                console.log(hora);
                                document.getElementById('id_cita').value = id_cita;
                                document.getElementById('id_citaEdit').value = id_cita;
                                document.getElementById('motivoEdit').value = motivo;
                                document.getElementById('mascotaEdit').value = mascota;
                                document.getElementById('fechaEdit').value = fecha;
                                document.getElementById('horaEdit').value = hora;
                                document.getElementById('cif_centroEdit').value = centro;
                                
                                $('.mostrarMotivo').html(motivo);
                                $('.mostrarFecha').html(fecha);
                                $('.mostrarHora').html(hora);
                                
                                $('#editarEliminarCitaModal').modal('show');
                            }
                            

                        });
                        calendar.render();

                    });

                </script>
            </div>

            <%@ include file="../layout/footer.jsp"%>

        </div>
            <div class="control-sidebar-bg"></div>

        <%@ include file="../layout/scripts.jsp"%>

    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="swetalert/sweetalert.js" type="text/javascript"></script>
    </body>
    
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>

