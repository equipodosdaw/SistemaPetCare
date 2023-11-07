<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetCare  Sign Up</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="dist/css/stylelog.css">
        <%@ include file="layout/links.jsp"%>
    </head>
    
    
    <body class="d-flex justify-content-center align-items-center vh-100">
        <div class="container col-lg-5 col-md-8 col-10 p-5 rounded-5 shadow">

            <div>
                <i class="bi bi-pencil-square log-sign-icons d-flex justify-content-center mb-2" id="login-icon"></i>
            </div>

            <div class="text-light d-flex justify-content-center mb-4">
                <h1>Sign Up</h1>
            </div>

            <div class="alert alert-danger alert-dismissible fade show" role="alert" style="display:${loginPsw ? 'block' : 'none'}" >
                Te has regisrado correctamente <a href="login.jsp" id="login-link" class="link-light">Loguéate</a>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
                
                
                <div id="error" class="alert alert-danger ocultar" role="alert">
                    Las contraseñas no coinciden, vuelve a intentarlo
                </div>
            <script>
                $('.alert').alert();
            </script>

            <form action="srvUsuario?accion=registrar" onsubmit="verificarPasswords(); return false" method="post" name="formRegistro">
                <div class="mb-2">
                    <input type="text" placeholder="Usuario" class="form-control rounded-3" id="nombre" name="txtNombre" required>
                </div>

                <div class="mb-2">
                    <input type="email" placeholder="Email" class="form-control rounded-3" id="email" name="txtEmail" required>
                </div>

                <div class="mb-2">
                    <input type="password" placeholder="Contraseña" class="form-control  rounded-3" id="password" name="txtClave" required>
                </div>

                <div class="mb-4">
                    <input type="password" placeholder="Repite contraseña" class="form-control  rounded-3" id="password2" name="txtClave2" required>
                </div>

                <div class="input-group mb-3 justify-content-center">
                    <button type="submit" name="btnRegistrar" value="Registrar"  class="btn btn-primary rounded-5 login-btn p-5 pb-2 pt-2"><b>SIGN UP</b></button>
                </div>

            </form>

            <div>
                <label for="login-link" class="text-light">¿Ya tienes cuenta?</label>
                <a href="login.jsp" id="login-link" class="link-light">Loguéate</a>
            </div>
        </div>
                <script>
                    
                     
function verificarPasswords() {
 
    // Ontenemos los valores de los campos de contraseñas 
    pass1 = document.getElementById('password');
    pass2 = document.getElementById('password2');
 
    // Verificamos si las constraseñas no coinciden 
    if (pass1.value != pass2.value) {
 
        // Si las constraseñas no coinciden mostramos un mensaje 
        document.getElementById("error").classList.add("mostrar");
        return false;
        
        setTimeout(function() {
            location.reload();
        }, 3000);
    } else {
 
        // Si las contraseñas coinciden ocultamos el mensaje de error
        document.getElementById("error").classList.remove("mostrar");
 
        // Desabilitamos el botón de login 
        document.getElementById("login").disabled = true;
       
        return true;
    }
 
}
                    
                </script>
        <%@ include file="layout/scripts.jsp"%>
    </body>
</html>
