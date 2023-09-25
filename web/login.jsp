<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PetCare | Login</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="dist/css/stylelog.css">
        <%@ include file="layout/links.jsp"%>

    </head>
    <body class="d-flex justify-content-center align-items-center vh-100">
        <div class="container col-lg-5 col-md-8 col-10 p-5 rounded-5 shadow">

            <div>
                <i class="bi bi-person-circle log-sign-icons d-flex justify-content-center mb-2" id="login-icon"></i>
            </div>

            <div class="text-light d-flex justify-content-center mb-4">
                <h1>Login</h1>
            </div>

            <form action="srvUsuario?accion=verificar" method="POST">
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display:${loginFailed ? 'block' : 'none'}" >
                    El nombre de usuario o el password son incorrectos. <strong>Inténtelo nuevamente.</strong>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <script>
                    $('.alert').alert();
                </script>

                <div class="form-floating mb-2">
                    <input type="text" name="txtUsu" id="txtUsu" value="" placeholder="Usuario" class="form-control" required>
                    <label for="txtUsu">Usuario</label>
                </div>

                <div class="form-floating mb-2">
                    <input type="password" name="txtPass" id="txtPass" value="" placeholder="Contraseña" class="form-control" id="password" required>
                    <label for="txtPass">Password</label>
                </div>

                <div class="input-group text-light d-flex justify-content-between mb-3">
                    <div>
                        <input id="Remember" type="checkbox" class="form-check-input">
                        <label for="Remember" class="form-check-label"><small>Récuerdame</small></label>
                    </div>
                    <div>
                        <small><a href="#" class="link-light">¿Has olvidado la contraseña?</a></small>
                    </div>
                </div>

                <div class="input-group mb-3 justify-content-center">
                    <button type="submit" name="verificar" value="Verificar" class="btn btn-primary rounded-5 login-btn p-5 pb-2 pt-2"><b>LOG IN</b></button>
                </div>

            </form>

            <div>
                <label for="signup-link" class="text-light">¿No tienes cuenta?</label>
                <a href="signup.jsp" id="signup-link" class="link-light">Registrate</a>
            </div>
        </div>

        <%@ include file="layout/scripts.jsp"%>

        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' /* optional */
                });
            });
        </script>

    </body>
</html>

