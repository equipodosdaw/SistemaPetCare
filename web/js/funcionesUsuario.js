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


