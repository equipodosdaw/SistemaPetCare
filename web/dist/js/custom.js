// Funcion comprobar que el password es el mismo
function comprobarPswIguales() {
    psw1 = document.formRegistro.txtClave.value;
    psw2 = document.formRegistro.txtClave2.value;


    if (psw1 == psw2) {
        document.formRegistro.submit();
    } else {
        document.getElementById("alertMsg").innerHtml = "Los passwords no son iguales";
    }

}
