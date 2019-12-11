var riskSelected, tableUsuarios;

function getTreatment(codigoRiesgo) {
    var obj = JSON.stringify({
        riskId: codigoRiesgo
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/GetTreatment",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d != null) {
                llenarDatosTreatment(data.d);
            } else {
                document.getElementById("lblCodigoTratamiento").innerHTML = "";
            }
        }
    });
}

function llenarDatosTreatment(datosTratamiento) {
    document.getElementById("lblNombreControlTrat").innerHTML = datosTratamiento.CONTROL_NAME;
    document.getElementById("lblPersonaNombreTrat").innerHTML = datosTratamiento.PERSON_IN_CHARGE_NAME;
    document.getElementById("lblDescripcionTrat").innerHTML = datosTratamiento.TREATMENT_DESCRIPTION;
    document.getElementById("lblRespuestaTrat").innerHTML = datosTratamiento.RISK_RESPONSE_DESCRIPTION;
}

$(document).on('click', '#btnSaveTreatment', function (e) {
    e.preventDefault();
    saveTreatment();
    //limpiarCamposTratar();
    $("#modal_agregar_tratamiento").modal('toggle');
    var codigoRiesgo = document.getElementById("lblCodigoRiesgo3").innerHTML;
    getTreatment(codigoRiesgo);
    //llenar campos
    //goAgregarRiesgos();
});


function saveTreatment() {
    riskSelected = document.getElementById("lblCodigoRiesgo3").innerHTML;
    var obj = JSON.stringify({
        description: $("#txtDescripcionTratamiento").val(),
        riskResponse: $("#ddlRespuestaRiesgo").val(),
        riskId: riskSelected,
        controlName: $("#txtNombreControl").val(),
        personInCharge: $("#txtPersonaEncargada").val()
    });

    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/SaveTreatment",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Registro creado de manera correcta.");

            } else {
                alert("No se pudo crear el registro.");
            }
        }
    });
}

function limpiarCamposTratar() {
    $("#txtNombreTratamiento").val("");
    $("#txtNombreControl").val("");
    $("#txtDescripcionTratamiento").val("");
    $("#txtPersonaEncargada").val("");
    $("#txtPersonaEncargadaNombre").val("");
    document.getElementById("ddlRespuestaRiesgo").selectedIndex = 0;
}
//-------------------------------------------------------------//
$(document).on('click', '#btnListUsers', function (e) {
    e.preventDefault();
    $("#modal_users").modal();
    listarUsuarios();
});

function listarUsuarios() {
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/ListUsers",
        data: [],
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#tbl_users").DataTable().destroy();
            llenarTablaUsuarios(data.d);
        }
    });
}

function llenarTablaUsuarios(data) {
    tableUsuarios = $("#tbl_users").DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        columns: [
            null,
            null,
            { "bSortable": false }
        ]
    });

    tableUsuarios.clear();

    for (var i = 0; i < data.length; i++) {
        tableUsuarios.row.add([
            data[i].USER_ID,
            data[i].FULL_NAME,
            '<button class="btn waves-effect waves-light" style="width: 40px; background-color: green; color:#FFFFFF;" title="Seleccionar" id="btnSeleccionarUser"> <i class="fas fa-check"></i></button>'

        ]).draw(false);
    }
}

$(document).on('click', '#btnSeleccionarUser', function (e) {
    e.preventDefault();
    $("#modal_users").modal('toggle');
    var datos = tableUsuarios.row($(this).parents("tr")).data();
    var codigoUsuario = JSON.stringify(datos[0]);
    var fullNameUsuario = JSON.stringify(datos[1]);
    document.getElementById("txtPersonaEncargada").value = codigoUsuario;
    document.getElementById("txtPersonaEncargadaNombre").value = fullNameUsuario.length != 0 ? fullNameUsuario.substr(1, fullNameUsuario.length - 2) : '';;
});

$(document).on('click', '#btnOpenTratamiento', function (e) {
    e.preventDefault();
    $("#modal_agregar_tratamiento").modal();
    var codigoRiesgo = document.getElementById("lblCodigoRiesgo3").innerHTML;
    llenarTreatment(codigoRiesgo);
});

function llenarTreatment(codigoRiesgo) {
    var obj = JSON.stringify({
        riskId: codigoRiesgo
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/GetTreatment",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d != null && data.d.TREATMENT_ID != 0) {
                $("#txtNombreTratamiento").val(data.d.TREATMENT_NAME);
                $("#ddlRespuestaRiesgo").val(data.d.RISK_RESPONSE);
                $("#txtDescripcionTratamiento").val(data.d.TREATMENT_DESCRIPTION);
                $("#txtNombreControl").val(data.d.CONTROL_NAME)
                $("#txtPersonaEncargada").val(data.d.PERSON_IN_CHARGE);
                $("#txtPersonaEncargadaNombre").val(data.d.PERSON_IN_CHARGE_NAME);
            } else {
                limpiarCamposTratar();
            }
        }
    });
}