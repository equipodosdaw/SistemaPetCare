
$(document).ready(function () {
    $("tr #deleteUser").click(function (e) {
        e.preventDefault();
        var cod = $(this).parent().find("#codigo").val();
        swal({
            title: "Estas seguro de eliminar el usuario?",
            text: "Una vez eliminado no se podrá recuperar!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Eliminar",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false,
            closeOnCancel: false
        },
                function (isConfirm) {
                    if (isConfirm) {
                        eliminarUsuario(cod);
                        swal("Eliminado!", "El usuario ha sido eliminado.", "success");
                        setTimeout(function (){
                           parent.location.href = "srvUsuario?accion=listasUsuarios";
                        }, 1800);
                    } else {
                        swal("Cancelado", "Cancelaste la eliminación", "error");
                    }
                });
    });

    function eliminarUsuario(cod) {
        var url = "srvUsuario?accion=eliminarUsuario&cod=" + cod;
        console.log("eliminado");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function(r){
                
            }
        });
    }
    
});

$(document).ready(function () {
    $("tr #deleteMascota").click(function (e) {
        e.preventDefault();
        var cod = $(this).parent().find("#codigo").val();
        swal({
            title: "Estas seguro de eliminar la mascota?",
            text: "Una vez eliminada no se podrá recuperar!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Eliminar",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false,
            closeOnCancel: false
        },
                function (isConfirm) {
                    if (isConfirm) {
                        eliminarUsuario(cod);
                        swal("Eliminado!", "La mascota ha sido eliminada.", "success");
                        setTimeout(function (){
                           parent.location.href = "srvMascota?accion=listasMascotas";
                        }, 1800);
                    } else {
                        swal("Cancelado", "Cancelaste la eliminación", "error");
                    }
                });
    });

    function eliminarUsuario(cod) {
        var url = "srvMascota?accion=eliminarMascota&cod=" + cod;
        console.log("eliminado");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function(r){
                
            }
        });
    }
    
});

$(document).ready(function () {
    $("#desactivarUsuario").click(function (e) {
        console.log("click");
        e.preventDefault();
        var cod = $(this).parent().find("#item").val();
        swal({
            title: "Esta Seguro de Desactivar este Usuario?",
            text: "Una vez desactivado no podrá ingresar al sistema!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Sí, Desactivar!",
            cancelButtonText: "No, Cancelar!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
            function (isConfirm) {
                if (isConfirm) {
                   desactivarUsuario(cod);
                    swal("Desactivado!", "El usuario se ha desactivado", "success");
                    setTimeout(function () {
                    parent.location.href = "srvUsuario?accion=listasUsuarios"
                    }, 1800);
                    } else {
                        swal("Cancelado", "No se desactivo", "error");
                    }
                });
    });

    function desactivarUsuario(cod) {
        var url = "srvUsuario?cambiar=desactivar&cod=" + cod;
        console.log("desactivado");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {

            }
        });
    }
});




$(document).ready(function () {
    $("#activarUsuario").click(function (e) {
        e.preventDefault();
        var cod = $(this).parent().find("#item").val();
        swal({
            title: "Esta Seguro de Activar este Usuario?",
            text: "Una vez activado ingresará al sistema!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Sí, Activar!",
            cancelButtonText: "No, Cancelar!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
            function (isConfirm) {
                if (isConfirm) {
                   activarUsuario(cod);
                    swal("Activado!", "El usuario se ha activado", "success");
                    setTimeout(function () {
                    parent.location.href = "srvUsuario?accion=listasUsuarios"
                    }, 1800);
                    } else {
                        swal("Cancelado", "No se desactivo", "error");
                    }
                });
    });

    function activarUsuario(cod) {
        var url = "srvUsuario?cambiar=activar&cod=" + cod;
        console.log("activado");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {

            }
        });
    }
});


$(document).ready(function () {
    $("#desactivarMascota").click(function (e) {
        console.log("click");
        e.preventDefault();
        var cod = $(this).parent().find("#item").val();
        swal({
            title: "Esta Seguro de Desactivar esta Mascota?",
            text: "Una vez desactivado quedará inactiva en el Sistema!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Sí, Desactivar!",
            cancelButtonText: "No, Cancelar!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
            function (isConfirm) {
                if (isConfirm) {
                   desactivarUsuario(cod);
                    swal("Desactivado!", "La mascota se ha desactivado", "success");
                    setTimeout(function () {
                    parent.location.href = "srvMascota?accion=listasMascotas"
                    }, 1800);
                    } else {
                        swal("Cancelado", "No se desactivo", "error");
                    }
                });
    });

    function desactivarUsuario(cod) {
        var url = "srvMascota?cambiar=desactivar&cod=" + cod;
        console.log("desactivado");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {

            }
        });
    }
});




$(document).ready(function () {
    $("#activarMascota").click(function (e) {
        e.preventDefault();
        var cod = $(this).parent().find("#item").val();
        swal({
            title: "Esta Seguro de Activar esta Mascota?",
            text: "Una vez activada ingresará al sistema!",
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Sí, Activar!",
            cancelButtonText: "No, Cancelar!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
            function (isConfirm) {
                if (isConfirm) {
                   activarUsuario(cod);
                    swal("Activado!", "La mascota se ha activado", "success");
                    setTimeout(function () {
                    parent.location.href = "srvMascota?accion=listasMascotas"
                    }, 1800);
                    } else {
                        swal("Cancelado", "No se desactivo", "error");
                    }
                });
    });

    function activarUsuario(cod) {
        var url = "srvMascota?cambiar=activar&cod=" + cod;
        console.log("activado");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {

            }
        });
    }
});




