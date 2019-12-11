var tableCause, codigoRiesgoSeleccionado;

function loadCauses(codigoRiesgo) {
    var obj = JSON.stringify({
        riskId: codigoRiesgo
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/ListCauses",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#tbl_causas").DataTable().destroy();
            llenarTablaCausa(data.d);
        }
    });
}

function llenarTablaCausa(data) {
    tableCause = $("#tbl_causas").DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        columns: [
            null,
            null,
            null,
            null,
            { "bSortable": false }
        ]
    });

    tableCause.clear();

    for (var i = 0; i < data.length; i++) {
        tableCause.row.add([
            data[i].CAUSE_ID,
            data[i].CAUSE_DESCRIPTION,
            data[i].CAUSE_PERCENT,
            data[i].CAUSE_TYPE_NAME,
            '<button class="btn btn-success waves-effect waves-light" style="width: 40px;" title="Consecuencias" id="btnOpenConsecuencia"> <i class="fas fa-list"></i></button> '+
            '<button class="btn btn-warning waves-effect waves-light" style="width: 40px;" title="Editar" id="btnEditarCausa"> <i class="fas fa-pencil-alt"></i></button> '+
            '<button class="btn btn-danger waves-effect waves-light" style="width: 40px;" title="Eliminar" id="btnEliminarCausa"> <i class="fas fa-times"></i></button>'
            
        ]).draw(false);
    }
}

$("#btnSaveCause").click(function (e) {
    e.preventDefault();
    saveCause();
    $("#modal_nueva_causa").modal('toggle');
    //tablaProject.fnDestroy();
    var riskIdSelect = codigoRiesgoSeleccionado;
    loadCauses(riskIdSelect);
});

function saveCause() {
    codigoRiesgoSeleccionado = document.getElementById("lblCodigoRiesgo").innerHTML;
    var obj = JSON.stringify({
        descripcion: $("#txtDescripcionCausa").val(),
        porcentaje: $("#txtPorcentaje").val(),
        tipoCausa: $("#ddlTipoCausa").val(),
        riskId: codigoRiesgoSeleccionado
    });

    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/SaveCause",
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

$(document).on('click', '#btnOpenConsecuencia', function (e) {
    e.preventDefault();
    $("#modal_consecuencias").modal();
    var datos = tableCause.row($(this).parents("tr")).data();
    //console.log(datos);
    var codigoCausa = JSON.stringify(datos[0]);
    document.querySelector('#lblCauseId').innerText = codigoCausa;
    loadEffects(codigoCausa);
});

//btnEditarCausa
$(document).on('click', '#btnEditarCausa', function (e) {
    e.preventDefault();
    $("#modal_editar_causa").modal();
    var datos = tableCause.row($(this).parents("tr")).data();
    var codigoCausa = JSON.stringify(datos[0]);
    var nombreCausa = JSON.stringify(datos[1]);
    var nombre = nombreCausa.substr(1, nombreCausa.length - 2);
    var porcentaje = JSON.stringify(datos[2]);
    var tipoCausa = JSON.stringify(datos[3]);
    var tipo = tipoCausa.substr(1, tipoCausa.length - 2);
    document.getElementById("lblCausaId").innerHTML = codigoCausa;
    document.querySelector('#txtDescripcionCausaModal').value = nombre;
    document.querySelector('#txtPorcentajeModal').value = porcentaje;
    document.querySelector('#ddlTipoCausaModal').selectedIndex = tipo=='Interno'?0:1;
    loadEffects(codigoCausa);
});

$(document).on('click', '#btnSaveCauseEditado', function (e) {
    e.preventDefault();
    codigoRiesgoSeleccionado = document.getElementById("lblCodigoRiesgo").innerHTML;
    var id = document.getElementById("lblCausaId").innerHTML;
    var descripcion = document.getElementById("txtDescripcionCausaModal").value;
    var porcentaje = document.getElementById("txtPorcentajeModal").value;
    var tipo = document.getElementById("ddlTipoCausaModal").value;
    updateCause(id, descripcion, porcentaje, tipo);
    $("#modal_editar_causa").modal('toggle');
    loadCauses(codigoRiesgoSeleccionado);
});

function updateCause(id, descripcion, porcentaje, tipo) {
    var obj = JSON.stringify({
        causeId: id,
        description: descripcion,
        percent: porcentaje,
        causeType: tipo
    });

    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/UpdateCause",
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
//btnEditarCausa
$(document).on('click', '#btnEliminarCausa', function (e) {
    e.preventDefault();
    $("#modal_eliminar_causa").modal();
    var datos = tableCause.row($(this).parents("tr")).data();
    var codigoCausa = JSON.stringify(datos[0]);
    document.getElementById("lblCausaIdEliminar").innerHTML = codigoCausa;
});

$(document).on('click', '#btnConfirmarEliminarCausa', function (e) {
    e.preventDefault();
    var id = document.getElementById("lblCausaIdEliminar").innerHTML;
    deleteCausa(id);
    $("#modal_eliminar_causa").modal('toggle');

});

function deleteCausa(id) {
    var obj = JSON.stringify({
        causeId: id
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/DeleteCause",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            codigoRiesgoSeleccionado = document.getElementById("lblCodigoRiesgo").innerHTML;
            loadCauses(codigoRiesgoSeleccionado);
        }
    });
}