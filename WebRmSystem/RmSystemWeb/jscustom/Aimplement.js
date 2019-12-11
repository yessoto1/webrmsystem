var riskSelected;

function getImplement(codigoRiesgo) {
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
            if (data.d != null && data.d.RISK_ID!= 0) {
                llenarDatosImplement(data.d);
            } else {
                document.getElementById("lblNombreControl").innerHTML = "";
                document.getElementById("lblPersonaEncargada").innerHTML = "";
                document.getElementById("lblDescripcionTratamiento").innerHTML = "";
                document.getElementById("lblRespuestaRiesgo").innerHTML = "";
            }
        }
    });
}

function llenarDatosImplement(datosTratamiento) {
    document.getElementById("lblNombreControl").innerHTML = datosTratamiento.CONTROL_NAME;
    document.getElementById("lblPersonaEncargada").innerHTML = datosTratamiento.PERSON_IN_CHARGE_NAME;
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
        url: "AdminManagement.aspx/CloseRisk",
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
