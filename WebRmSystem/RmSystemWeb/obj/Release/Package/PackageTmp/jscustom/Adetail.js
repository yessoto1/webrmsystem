
var riskSelected;

function getDetail(codigoRiesgo) {
    var obj = JSON.stringify({
        riskId: codigoRiesgo
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/GetAnalysisDetail",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d != null) {
                llenarDatosDetalle(data.d);
            } else {
                camposEnBlanco();
                limpiarCamposDetail();
            }
        }
    });
}

function llenarDatosDetalle(datosDetalle) {
    document.getElementById("lblImpactoDetalle").innerHTML = datosDetalle.IMPACT_DESCRIPTION;
    document.getElementById("lblProbabilidadDetalle").innerHTML = datosDetalle.PROBABILITY_DESCRIPTION;
    document.getElementById("lblSeveridadDetalle").innerHTML = datosDetalle.SEVERIDAD;
}

$(document).on('click', '#btnSaveDetail', function (e) {
    e.preventDefault();
    saveDetail();
    //limpiarCamposDetail();
    $("#modal_agregar_detalle").modal('toggle');
    var codigoRiesgo = document.getElementById("lblCodigoRiesgo2").innerHTML;
    getDetail(codigoRiesgo);
});

function saveDetail() {
    riskSelected = document.getElementById("lblCodigoRiesgo2").innerHTML;
    riskTypeMatrix = document.getElementById("lblTipoRiesgo").innerHTML;
    var obj = JSON.stringify({
        impact: $("#ddlImpacto").val(),
        probability: $("#ddlProbabilidad").val(),
        riskId: riskSelected,
        riskType: riskTypeMatrix
    });

    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/SaveAnalysisDetail",
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

$(document).on('change', '#ddlImpacto', function (e) {
    e.preventDefault();

    var impact=$("#ddlImpacto").val();
    var probability = $("#ddlProbabilidad").val();
    calcularSeveridad(impact, probability);
});

$(document).on('change', '#ddlProbabilidad', function (e) {
    e.preventDefault();

    var impact = $("#ddlImpacto").val();
    var probability = $("#ddlProbabilidad").val();
    calcularSeveridad(impact, probability);
});

function calcularSeveridad(impact, probability) {
    if ((impact == 1 && probability == 1) ||
        (impact == 2 && probability == 1) ||
        (impact == 1 && probability == 2)) {
        document.getElementById("lblTipoRiesgo").innerHTML = "Bajo";
        document.getElementById("lblTipoRiesgo").style.color = "green";
    } else if (
        (impact == 3 && probability == 1) ||
        (impact == 2 && probability == 2) ||
        (impact == 1 && probability == 3) ||
        (impact == 4 && probability == 1)) {
        document.getElementById("lblTipoRiesgo").innerHTML = "Medio";
        document.getElementById("lblTipoRiesgo").style.color = "yellow";
    } else if (
        (impact == 4 && probability == 2) ||
        (impact == 3 && probability == 2) ||
        (impact == 3 && probability == 3) ||
        (impact == 2 && probability == 3) ||
        (impact == 2 && probability == 4)) {
        document.getElementById("lblTipoRiesgo").innerHTML = "Alto";
        document.getElementById("lblTipoRiesgo").style.color = "orange";
    } else {
        document.getElementById("lblTipoRiesgo").innerHTML = "Crítico";
        document.getElementById("lblTipoRiesgo").style.color = "red";
    }
}

function camposEnBlanco() {
    document.getElementById("lblImpactoDetalle").innerHTML = "";
    document.getElementById("lblProbabilidadDetalle").innerHTML = "";
    document.getElementById("lblSeveridadDetalle").innerHTML = "";
}

function limpiarCamposDetail() {
    //document.getElementById("lblDetailId").innerHTML = "";
    document.getElementById("ddlImpacto").selectedIndex = 0;
    document.getElementById("ddlProbabilidad").selectedIndex = 0;
    document.getElementById("lblTipoRiesgo").innerHTML = "Bajo";
    document.getElementById("lblTipoRiesgo").style.color = "green";
}

$(document).on('click', '#btnOpenDetalle', function (e) {
    e.preventDefault();
    $("#modal_agregar_detalle").modal();
    var codigoRiesgo = document.getElementById("lblCodigoRiesgo2").innerHTML;
    llenarDatosModalDetalle(codigoRiesgo);
});

function llenarDatosModalDetalle(codigoRiesgo) {
    var obj = JSON.stringify({
        riskId: codigoRiesgo
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/GetAnalysisDetail",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d != null) {
                $("#ddlImpacto").val(data.d.IMPACT);
                $("#ddlProbabilidad").val(data.d.PROBABILITY);
                calcularSeveridad(data.d.IMPACT, data.d.PROBABILITY);
            } else {
                
            }
        }
    });
}