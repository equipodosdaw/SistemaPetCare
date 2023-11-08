




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
                                            <input type="text" id="cif_centro" name="cif_centro" class="form-control" required>
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
                                    <h4 class="modal-title" id="citaModalLabel">Eliminar Cita</h4>
                                </div>
                                <div class="modal-body">
                                    <p>¿Estás seguro de que deseas cancelar esta cita?</p>
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
                                <div id="mainModalFooter" class="modal-footer">
                                    <button onclick="editarCita()" type="button" class="btn btn-default" >Editar cita</button>
                                    <button onclick="eliminarCita()" type="button" class="btn btn-danger">Eliminar cita</button>
                                </div>
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
                                    <!-- <input type="hidden" id="id_cita" name="id_cita"> -->
                                    <input type="hidden" id="id_cita_edit" name="id_cita_edit">
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
                                            <input type="text" id="cif_centro" name="cif_centro" class="form-control" required>
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
                        console.log('editar');
                    }
                    function eliminarCita(){
                        $('#editarEliminarCitaModal').modal('hide');
                        $('#eliminaCitaModal').modal('show');
                        console.log('eliminar');
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
                                document.getElementById('id_cita').value = id_cita;
                                document.getElementById('id_cita_edit').value = id_cita;
                                $('#editarEliminarCitaModal').modal('show');
                            }
                            

                        });
                        calendar.render();

                    });

                </script>

                <%@ include file="../layout/scripts.jsp"%>
                </body></div>

            <%@ include file="../layout/footer.jsp"%>

            <div class="control-sidebar-bg"></div>
        </div>

        <%@ include file="../layout/scripts.jsp"%>

    </body>
    
    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="swetalert/sweetalert.js" type="text/javascript"></script>
    <script src="js/funcionesUsuario.js" type="text/javascript"></script>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>

