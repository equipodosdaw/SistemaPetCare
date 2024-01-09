<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">






        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">

            <li class="active"><a href="#"><i class="fa fa-pie-chart"></i> <span>Dashboard</span></a></li>
            <li class="treeview">
                <a href="#"><i class="fa-solid fa-paw"></i><span>Mascotas</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        
                          <%
                            if (session.getAttribute("cliente") != null) {
                        %>
                        <a href="<c:url value="srvMascota">

                           <c:param name="accion" value="leerMascota" />
                           <c:param  name="cod" value="${cliente.id_usuario}" />

                            </c:url>">
                            <i class="fa-solid fa-pen-to-square"></i>Administrar Mascota</a>

                        <%
                            }
                        %>
                        
                         <%
                            if (session.getAttribute("admin") != null) {
                        %>
                         <a href="srvMascota?accion=listasMascotas"><i class="fa-solid fa-pen-to-square"></i>Administrar Mascotas</a>

                        <%
                            }
                        %>
                        
                       </li>
                    <li><a href="#"><i class="fa-solid fa-magnifying-glass"></i>Control de consultas</a></li>

                </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class="fa-solid fa-stethoscope"></i><span>Información Sanitaria</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa-solid fa-square-poll-vertical"></i>Informes Resultados</a></li>
                    <li><a href="#"><i class="fa-solid fa-syringe"></i>Vacunas</a></li>
                </ul>
            </li>
            <li><a href="srvUsuario?accion=calendario"><i class="fa-solid fa-calendar-days"></i> <span>Calendario</span></a></li>
            <li class="treeview">
                <a href="#"><i class="fa fa-cog"></i> <span>Configuración</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <%
                            if (session.getAttribute("cliente") != null) {
                        %>
                        <a href="<c:url value="srvUsuario">

                           <c:param name="accion" value="leerUsuario" />
                           <c:param  name="cod" value="${cliente.id_usuario}" />

                            </c:url>">
                            <i class="fa fa-users"></i>Administrar Usuario</a>

                        <%
                            }
                        %>
                        
                         <%
                            if (session.getAttribute("admin") != null) {
                        %>
                         <a href="srvUsuario?accion=listasUsuarios"><i class="fa-solid fa-user-pen"></i>Administrar Usuarios</a>

                        <%
                            }
                        %>

                       </li>
                </ul>
            </li>
        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>