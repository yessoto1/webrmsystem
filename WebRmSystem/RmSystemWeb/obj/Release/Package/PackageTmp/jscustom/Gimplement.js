var riskSelected;

function getImplement(codigoRiesgo) {
    var obj = JSON.stringify({
        riskId: codigoRiesgo
    });
    $.ajax({
        type: "POST",
        url: "GeneralManagement.aspx/GetTreatment",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d != null) {
                llenarDatosImplement(data.d);
            } else {
                document.getElementById("lblCodigoTratamiento").innerHTML = "";
            }
        }
    });
}

function llenarDatosImplement(datosTratamiento) {
    document.getElementById("lblNombreControl").innerHTML = datosTratamiento.CONTROL_NAME;
    document.getElementById("lblPersonaEncargada").innerHTML = datosTratamiento.PERSON_IN_CHARGE;
    document.getElementById("lblDescripcionTratamiento").innerHTML = datosTratamiento.TREATMENT_DESCRIPTION;
    document.getElementById("lblRespuestaRiesgo").innerHTML = datosTratamiento.RISK_RESPONSE_DESCRIPTION;
}

//btnSaveImplementar

$(document).on('click', '#btnSaveImplementar', function (e) {
    e.preventDefault();
    saveImplementar();
    goAgregarRiesgos();
    //recargar riesgos
    var idProject = document.querySelector('#lblCodigoProyecto').innerText;
    loadRisks(idProject);
});

function saveImplementar() {
    riskSelected = document.getElementById("lblCodigoRiesgo4").innerHTML;
    var obj = JSON.stringify({
        riskId: riskSelected
    });

    $.ajax({
        type: "POST",
        url: "GeneralManagement.aspx/CloseRisk",
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
