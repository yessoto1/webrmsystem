
var tablaRisk, codigoProyectoSeleccionado;

function llenarTablaRisk(data) {
    tablaRisk = $("#tbl_riesgos").DataTable();
    tablaRisk.destroy();
    tablaRisk = $("#tbl_riesgos").DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        columns: [
            null,
            null,
            null,
            null,
            { "bSortable": false }
            , { "bSortable": false }
        ]
    });

    tablaRisk.clear();

    for (var i = 0; i < data.length; i++) {
        tablaRisk.row.add([
            data[i].RISK_ID,
            data[i].RISK_TYPE_NAME,
            data[i].RISK_NAME,
            data[i].STATUS == false ? "Abierto" : "Cerrado",
            '<button class="btn btn-warning waves-effect waves-light" style="width: 40px;" title="Editar" id="btnEditarRiesgo"> <i class="fas fa-pencil-alt"></i></button> ' +
            '<button class="btn btn-danger waves-effect waves-light" style="width: 40px;" title="Eliminar" id="btnEliminarRiesgo"> <i class="fas fa-times"></i></button>',
            '<button class="btn waves-effect waves-light" style="width: 40px; background-color: #ff808a; color:#FFFFFF;" title="Identificar" id="btnVerIdentificar"> <i class="fas fa-search"></i></button> '+
            '<button class="btn waves-effect waves-light" style="width: 40px; background-color: #3F51B5; color:#FFFFFF;" title="Analizar y Evaluar" id="btnVerAnalizar"> <i class="fas fa-user-secret"></i></button> '+
            '<button class="btn waves-effect waves-light" style="width: 40px; background-color: #f0ad4e; color:#FFFFFF;" title="Tratar" id="btnVerTratar"> <i class="fas fa-handshake"></i></button> ' +
            '<button class="btn waves-effect waves-light" style="width: 40px; background-color: green; color:#FFFFFF;" title="Implementar" id="btnVerImplementar"> <i class="fas fa-check"></i></button>'
 
        ]).draw(false);
    }
}

function loadRisks(idProject) {
    var obj = JSON.stringify({projectId: idProject});
    $.ajax({
        type: "POST",
        url: "GeneralManagement.aspx/ListRisks",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#tbl_riesgos").DataTable().destroy();
            llenarTablaRisk(data.d);
        }
    });
}

$("#btnSaveRisk").click(function (e) {
    e.preventDefault();
    saveRisk();
    $("#modal_nuevo_riesgo").modal('toggle');
    //tablaProject.fnDestroy();
    var projId = codigoProyectoSeleccionado;
    loadRisks(projId);
});

function saveRisk() {
    codigoProyectoSeleccionado = document.getElementById("lblCodigoProyecto").innerHTML;
    var obj = JSON.stringify({
        riskName: $("#txtRiskName").val(),
        riskType: $("#ddlTipoRiesgo").val(),
        projectId: codigoProyectoSeleccionado
    });

    $.ajax({
        type: "POST",
        url: "GeneralManagement.aspx/SaveRisk",
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

$(document).on('click', '#btnVerIdentificar', function (e) {
    e.preventDefault();
    goIdentificar();
    var datos = tablaRisk.row($(this).parents("tr")).data();
    //console.log(datos);
    llenarDatosRiesgoSeleccionado(datos);
});

function goIdentificar() {
    $("#tab_historial").hide();
    $("#tab_identificar").show();
    $("#tab_analizar").hide();
    $("#tab_tratar").hide();
    $("#tab_riesgos").hide();
    $("#tab_implementar").hide();
    $(".nav .nav-tabs li").removeClass("active");
    $(".nav .nav-tabs li").removeClass("active");

    $("#tab2").removeClass("active");
    $("#tab1").removeClass("active");
    $("#tab3").addClass("active");
    $("#tab4").removeClass("active");
    $("#tab5").removeClass("active");
    $("#tab6").removeClass("active");
}

function llenarDatosRiesgoSeleccionado(datosRiesgo) {
    var codigoRiesgo = JSON.stringify(datosRiesgo[0]);
    var nombreRiesgo = JSON.stringify(datosRiesgo[2]);
    document.querySelector('#lblCodigoRiesgo').innerText = codigoRiesgo;
    document.querySelector('#lblNombreRiesgo').innerText = nombreRiesgo.length != 0 ? nombreRiesgo.substr(1, nombreRiesgo.length - 2) : '';
    loadCauses(codigoRiesgo);
}

$(document).on('click', '#btnVerAnalizar', function (e) {
    e.preventDefault();
    goAnalizar();
    //var row = $(this).parent().parent()[0];
    //var datosRiesgo = tablaRisk.fnGetData(row);

    var datosRiesgo = tablaRisk.row($(this).parents("tr")).data();

    llenarDatosRiesgoSeleccionado2(datosRiesgo);
});

function goAnalizar() {
    $("#tab_historial").hide();
    $("#tab_identificar").hide();
    $("#tab_analizar").show();
    $("#tab_tratar").hide();
    $("#tab_riesgos").hide();
    $("#tab_implementar").hide();
    $(".nav .nav-tabs li").removeClass("active");
    $(".nav .nav-tabs li").removeClass("active");

    $("#tab2").removeClass("active");
    $("#tab1").removeClass("active");
    $("#tab3").removeClass("active");
    $("#tab4").addClass("active");
    $("#tab5").removeClass("active");
    $("#tab6").removeClass("active");
}

function llenarDatosRiesgoSeleccionado2(datosRiesgo) {
    var codigoRiesgo = JSON.stringify(datosRiesgo[0]);
    var nombreRiesgo = JSON.stringify(datosRiesgo[2]);
    document.querySelector('#lblCodigoRiesgo2').innerText = codigoRiesgo;
    document.querySelector('#lblNombreRiesgo2').innerText = nombreRiesgo.length != 0 ? nombreRiesgo.substr(1, nombreRiesgo.length - 2) : '';
    getDetail(codigoRiesgo);
}

//btnVerTratar
$(document).on('click', '#btnVerTratar', function (e) {
    e.preventDefault();
    goTratar();
    var datosRiesgo = tablaRisk.row($(this).parents("tr")).data();
    llenarDatosRiesgoSeleccionado3(datosRiesgo);
});

function goTratar() {
    $("#tab_historial").hide();
    $("#tab_identificar").hide();
    $("#tab_analizar").hide();
    $("#tab_tratar").show();
    $("#tab_riesgos").hide();
    $("#tab_implementar").hide();
    $(".nav .nav-tabs li").removeClass("active");
    $(".nav .nav-tabs li").removeClass("active");

    $("#tab2").removeClass("active");
    $("#tab1").removeClass("active");
    $("#tab3").removeClass("active");
    $("#tab4").removeClass("active");
    $("#tab5").addClass("active");
    $("#tab6").removeClass("active");
}

function llenarDatosRiesgoSeleccionado3(datosRiesgo) {
    var codigoRiesgo = JSON.stringify(datosRiesgo[0]);
    var nombreRiesgo = JSON.stringify(datosRiesgo[2]);
    document.querySelector('#lblCodigoRiesgo3').innerText = codigoRiesgo;
    document.querySelector('#lblNombreRiesgo3').innerText = nombreRiesgo.length != 0 ? nombreRiesgo.substr(1, nombreRiesgo.length - 2) : '';
    getTreatment(codigoRiesgo);
}

$(document).on('click', '#btnVerImplementar', function (e) {
    e.preventDefault();
    goImplementar();
    var datos = tablaRisk.row($(this).parents("tr")).data();
    //console.log(datos);
    llenarDatosRiesgoSeleccionado4(datos);
});

function llenarDatosRiesgoSeleccionado4(datosRiesgo) {
    var codigoRiesgo = JSON.stringify(datosRiesgo[0]);
    var nombreRiesgo = JSON.stringify(datosRiesgo[2]);
    document.querySelector('#lblCodigoRiesgo4').innerText = codigoRiesgo;
    document.querySelector('#lblNombreRiesgo4').innerText = nombreRiesgo.length != 0 ? nombreRiesgo.substr(1, nombreRiesgo.length - 2) : '';
    getImplement(codigoRiesgo);
}

function goImplementar() {
    $("#tab_historial").hide();
    $("#tab_identificar").hide();
    $("#tab_analizar").hide();
    $("#tab_tratar").hide();
    $("#tab_riesgos").hide();
    $("#tab_implementar").show();
    $(".nav .nav-tabs li").removeClass("active");
    $(".nav .nav-tabs li").removeClass("active");

    $("#tab2").removeClass("active");
    $("#tab1").removeClass("active");
    $("#tab3").removeClass("active");
    $("#tab4").removeClass("active");
    $("#tab5").removeClass("active");
    $("#tab6").addClass("active");
}

//editar riesgo
$(document).on('click', '#btnEditarRiesgo', function (e) {
    e.preventDefault();
    var datos = tablaRisk.row($(this).parents("tr")).data();
    var codigoRiesgo = JSON.stringify(datos[0]);
    var tipoRiesgo = JSON.stringify(datos[1]);
    var tipo = tipoRiesgo.substr(1, tipoRiesgo.length - 2);
    var nombreRiesgo = JSON.stringify(datos[2]);
    var nombre = nombreRiesgo.substr(1, nombreRiesgo.length - 2);
    $("#modal_editar_riesgo").modal();
    document.getElementById("lblCodigoRiesgoModal").innerHTML = codigoRiesgo;
    document.getElementById("ddlTipoRiesgoModal").selectedIndex = tipo == 'Operativo' ? 0 : 1;
    document.getElementById("txtRiskNameModal").value = nombre;
});

//btnSaveRiskEditado
$(document).on('click', '#btnSaveRiskEditado', function (e) {
    e.preventDefault();
    var id = document.getElementById("lblCodigoRiesgoModal").innerHTML
    var nombre = document.getElementById("txtRiskNameModal").value;
    var tipo = document.getElementById("ddlTipoRiesgoModal").value;
    updateRisk(id, nombre, tipo);
    $("#modal_editar_riesgo").modal('toggle');
    codigoProyectoSeleccionado = document.getElementById("lblCodigoProyecto").innerHTML;
    loadRisks(codigoProyectoSeleccionado);
});

function updateRisk(id, nombre, tipo) {
    var obj = JSON.stringify({
        riskId: id,
        riskName: nombre,
        riskType: tipo
    });

    $.ajax({
        type: "POST",
        url: "GeneralManagement.aspx/UpdateRisk",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Registro actualizado de manera correcta.");

            } else {
                alert("No se pudo actualizar el registro.");
            }
        }
    });
}

//eliminar
$(document).on('click', '#btnEliminarRiesgo', function (e) {
    e.preventDefault();
    var datos = tablaRisk.row($(this).parents("tr")).data();
    var codigoRiesgo = JSON.stringify(datos[0]);
    $("#modal_eliminar_riesgo").modal();
    document.getElementById("lblRiesgoId").innerHTML = codigoRiesgo;
});

$(document).on('click', '#btnConfirmarEliminarRiesgo', function (e) {
    e.preventDefault();
    var id = document.getElementById("lblRiesgoId").innerHTML;
    deleteRiesgo(id);
    $('#modal_eliminar_riesgo').modal('hide');
});

function deleteRiesgo(id) {
    var obj = JSON.stringify({
        riskId: id
    });
    $.ajax({
        type: "POST",
        url: "GeneralManagement.aspx/DeleteRisk",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            if (data.d) {
                alert("Se eliminó el registro de manera correcta.");
                codigoProyectoSeleccionado = document.getElementById("lblCodigoProyecto").innerHTML;
                loadRisks(codigoProyectoSeleccionado);
            } else {
                alert("No se puede eliminar el registro.");
            }            
        }
    });
}