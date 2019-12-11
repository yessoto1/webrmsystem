var tableEffects, codigoCausaSeleccionado;

function llenarTablaConsecuencias(data) {
    tableEffects = $("#tbl_consecuencias").DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        columns: [
            null,
            null,
            null,
            { "bSortable": false }
        ]
    });

    tableEffects.clear();

    for (var i = 0; i < data.length; i++) {
        tableEffects.row.add([
            data[i].EFFECT_ID,
            data[i].DESCRIPTION,
            data[i].EFFECT_TYPE_NAME,
            '<button class="btn btn-warning waves-effect waves-light" style="width: 40px;" title="Editar" id="btnEditarEffect"> <i class="fas fa-pencil-alt"></i></button> ' +
            '<button class="btn btn-danger waves-effect waves-light" style="width: 40px;" title="Eliminar" id="btnEliminarEffect"> <i class="fas fa-times"></i></button>'
        ]).draw(false);
    }
}

function loadEffects(codigoCausa) {
    var obj = JSON.stringify({
        causeId: codigoCausa
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/ListEffects",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#tbl_consecuencias").DataTable().destroy();
            llenarTablaConsecuencias(data.d);
        }
    });
}

$(document).on('click', '#btnOpenAgregarConsecuencia', function (e) {
    e.preventDefault();
    $("#modal_nueva_consecuencia").modal();
    
});

$(document).on('click', '#btnSaveConsecuencia', function (e) {
    e.preventDefault();
    saveEffect();
    $("#modal_nueva_consecuencia").modal('toggle');
    loadEffects(codigoCausaSeleccionado);
});

function saveEffect() {
    codigoCausaSeleccionado = document.getElementById("lblCauseId").innerHTML;
    var obj = JSON.stringify({
        description: $("#txtDescription").val(),
        effectType: $("#ddlTipoConsecuencia").val(),
        causeId: codigoCausaSeleccionado
    });

    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/SaveEffect",
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

//editar
$(document).on('click', '#btnEditarEffect', function (e) {
    e.preventDefault();
    $("#modal_editar_consecuencia").modal();
    var datos = tableEffects.row($(this).parents("tr")).data();
    var codigoEffect = JSON.stringify(datos[0]);
    var nombreEffect = JSON.stringify(datos[1]);
    var nombre = nombreEffect.substr(1, nombreEffect.length - 2);
    document.getElementById("lblEffectIdEditar").innerHTML = codigoEffect;
    document.querySelector('#txtDescriptionEditar').value = nombre;
});

$(document).on('click', '#btnSaveConsecuenciaEditado', function (e) {
    e.preventDefault();
    var id = document.getElementById("lblEffectIdEditar").innerHTML;
    var description = document.querySelector('#txtDescriptionEditar').value;
    updateEffect(id, description);
    $("#modal_editar_consecuencia").modal('toggle');
});

function updateEffect(id, descriptionA) {
    var obj = JSON.stringify({
        effectId: id,
        description: descriptionA
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/UpdateEffect",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            codigoCausaSeleccionado = document.getElementById("lblCauseId").innerHTML;
            loadEffects(codigoCausaSeleccionado);
        }
    });
}

//eliminar
$(document).on('click', '#btnEliminarEffect', function (e) {
    e.preventDefault();
    var datos = tableEffects.row($(this).parents("tr")).data();
    var codigoEffect = JSON.stringify(datos[0]);
    $("#modal_eliminar_effect").modal();
    document.getElementById("lblEffectIdEliminar").innerHTML = codigoEffect;
});

$(document).on('click', '#btnConfirmarEliminarEffect', function (e) {
    e.preventDefault();
    var id = document.getElementById("lblEffectIdEliminar").innerHTML;
    deleteEffect(id);
    $("#modal_eliminar_effect").modal('toggle');
});

function deleteEffect(id) {
    var obj = JSON.stringify({
        effectId: id
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/DeleteEffect",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            codigoCausaSeleccionado = document.getElementById("lblCauseId").innerHTML;
            loadEffects(codigoCausaSeleccionado);
        }
    });
}