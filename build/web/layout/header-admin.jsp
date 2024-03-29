<header class="main-header">
    <a href="#" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><img class="img-fluid" src="dist/img/logo/logo_mini_PETCARE.png" alt=""/></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><img class="img-fluid" src="dist/img/logo/logo_blanco_PETCARE.png" alt=""/></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <c:if test="${admin.nombreUsuario != null}">
                            <span class="hidden-xs"> ${admin.nombreUsuario}</span>
                            <img src="dist/img/admin.png" class="user-image" alt="User Image">
                        </c:if>
                        <c:if test="${cliente.nombreUsuario != null}">
                            <span class="hidden-xs"> ${cliente.nombreUsuario}</span>
                            <img src="dist/img/user.png" class="user-image" alt="User Image">
                        </c:if>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <c:if test="${admin.nombreUsuario != null}">
                            <img src="dist/img/admin.png" class="img-circle" alt="User Image">

                            <p>   
                                Bienvenido - ${admin.nombreUsuario}
                                <small>Usted es,${admin.perfilUsuario.nombrePerfil} </small>
                            </p>
                            </c:if>
                            
                            <c:if test="${cliente.nombreUsuario != null}">
                            <img src="dist/img/user.png" class="img-circle" alt="User Image">

                            <p>   
                                Bienvenido - ${cliente.nombreUsuario}
                                <small>Usted es,${cliente.perfilUsuario.nombrePerfil} </small>
                            </p>
                            </c:if>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-right">
                                <a href="srvUsuario?accion=cerrar" class="btn btn-default btn-flat">Cerrar Session</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>