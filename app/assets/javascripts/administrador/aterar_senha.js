$(document).ready(function () {
    $('#administrador_password').keyup(function() {
        var valor = $('#administrador_password').val();
        if (valor == ""){
            $("#administrador_password_confirmation").attr("disabled", "disabled");
        } else {
            $("#administrador_password_confirmation").removeAttr("disabled");
        }
    });

    $('#administrador_password_confirmation').keyup(function() {
        var valor = $('#administrador_password').val();
        var valor_confirmation = $('#administrador_password_confirmation').val();
        if (valor_confirmation == valor){
            $('#btn-alterar-senha').removeAttr("disabled");
        } else {
            $('#btn-alterar-senha').attr("disabled", "disabled");
        }

    });
});


