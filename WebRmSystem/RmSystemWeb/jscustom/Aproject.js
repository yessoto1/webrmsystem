loadProjects();

var tablaProject;

function loadProjects() {
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/ListProjects",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#tbl_proyectos").DataTable().destroy();
            llenarTablaProject(data.d);
        }
    });
}

function llenarTablaProject(data) {
    tablaProject = $('#tbl_proyectos').DataTable({
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        columns: [
            null,
            null,
            null,
            { "bSortable": false }
        ]
    });

    tablaProject.clear();

    for (var i = 0; i < data.length; i++) {
        tablaProject.row.add([
            data[i].PROCESS_ID,
            data[i].PROCESS_NAME,
            moment(data[i].CREATED_DATE).format('DD/MM/YYYY'),
            //'fecha',
            '<button class="btn waves-effect waves-light" style="width: 40px; background-color: #0c5460; color: #FFFFFF;" title="Ver Riesgos" id="btnVerRiesgos""><i class="fas fa-clipboard-check"></i></button> ' +
            '<button class="btn btn-warning waves-effect waves-light" style="width: 40px;" title="Editar" id="btnEditarProyecto"> <i class="fas fa-pencil-alt"></i></button> ' +
            '<button class="btn btn-danger waves-effect waves-light" style="width: 40px;" title="Eliminar" id="btnEliminarProyecto"><i class="fas fa-times"></i></button> ' +
            '<button class="btn btn-success waves-effect waves-light" style="width: 40px;" title="Descargar" id="btnOpenInforme"><i class="fas fa-download"></i></button>'
        ]).draw(false);
    }
}

function saveProject() {
    var obj = JSON.stringify({
        name: $("#txtProjectName").val()
    });

    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/SaveProject",
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

$("#btnSaveProject").click(function (e) {
    e.preventDefault();
    saveProject();
    $("#modal_nuevo_proyecto").modal('toggle');
    //tablaProject.fnDestroy();
    loadProjects();
});

function llenarDatosProyectoSeleccionado(data) {
    var id = JSON.stringify(data[0]);
    var name = JSON.stringify(data[1]);
    document.querySelector('#lblCodigoProyecto').innerText = id;
    document.querySelector('#lblNombreProyecto').innerText = name.length != 0 ? name.substr(1, name.length - 2) : '';
    loadRisks(id);
}

$(document).on('click', '#btnVerRiesgos', function (e) {
    e.preventDefault();
    goAgregarRiesgos();
    var datos = tablaProject.row($(this).parents("tr")).data();
    //console.log(datos);
    llenarDatosProyectoSeleccionado(datos);
});

function goAgregarRiesgos() {
    $("#tab_historial").hide();
    $("#tab_identificar").hide();
    $("#tab_analizar").hide();
    $("#tab_tratar").hide();
    $("#tab_implementar").hide();
    $("#tab_riesgos").show();
    $(".nav .nav-tabs li").removeClass("active");

    $("#tab1").removeClass("active");
    $("#tab3").removeClass("active");
    $("#tab4").removeClass("active");
    $("#tab5").removeClass("active");
    $("#tab6").removeClass("active");
    $("#tab2").addClass("active");
}

$(document).on('click', '#btnDownload', function (e) {
    e.preventDefault();
    var datosProyecto = tablaProject.row($(this).parents("tr")).data();
    var codigoProyecto = JSON.stringify(datosProyecto[0]);

    var obj = JSON.stringify({
        projectId: codigoProyecto
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/ToPdf",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d) {
                alert("Se descargó el archivo de manera correcta.");

            } else {
                alert("No se pudo descargar el archivo.");
            }
        }
    });
});

//eliminar
$(document).on('click', '#btnEliminarProyecto', function (e) {
    e.preventDefault();
    $("#modal_eliminar_proyecto").modal();
    var datos = tablaProject.row($(this).parents("tr")).data();
    //console.log(datos);
    var codigoProyecto = JSON.stringify(datos[0]);
    document.getElementById("lblProyectoId").innerHTML = codigoProyecto;
});

$(document).on('click', '#btnConfirmarEliminarProyecto', function (e) {
    e.preventDefault();
    var id = document.getElementById("lblProyectoId").innerHTML;
    deleteProyecto(id);
    $('#modal_eliminar_proyecto').modal('hide');
});

function deleteProyecto(id) {
    var obj = JSON.stringify({
        projectId: id
    });
    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/DeleteProject",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#tbl_proyectos").DataTable().destroy();
            loadProjects();
        }
    });
}

//Editar
$(document).on('click', '#btnEditarProyecto', function (e) {
    e.preventDefault();
    var datos = tablaProject.row($(this).parents("tr")).data();
    var codigoProyecto = JSON.stringify(datos[0]);
    var nombreProyecto = JSON.stringify(datos[1]);
    var nombre = nombreProyecto.substr(1, nombreProyecto.length - 2);
    $("#modal_editar_proyecto").modal();
    document.getElementById("lblProyectoIdModal").innerHTML = codigoProyecto;
    document.getElementById("txtNombreProyectoModal").value = nombre;

});

//btnSaveProjectEditado
$(document).on('click', '#btnSaveProjectEditado', function (e) {
    e.preventDefault();
    var id= document.getElementById("lblProyectoIdModal").innerHTML
    var nombre = document.getElementById("txtNombreProyectoModal").value;
    updateProject(id, nombre);
    $("#modal_editar_proyecto").modal('toggle');
    loadProjects();

});

function updateProject(id, nombre) {
    var obj = JSON.stringify({
        projectId: id,
        projectName: nombre
    });

    $.ajax({
        type: "POST",
        url: "AdminManagement.aspx/UpdateProject",
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