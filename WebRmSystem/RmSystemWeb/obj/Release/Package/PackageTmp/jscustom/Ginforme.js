
$(document).on('click', '#btnOpenInforme', function (e) {
    e.preventDefault();
    $("#modal_informe").modal();
    var datos = tablaProject.row($(this).parents("tr")).data();
    var projectId = JSON.stringify(datos[0]);
    ObtenerDatosInforme(projectId);

});

function ObtenerDatosInforme(id) {
    var obj = JSON.stringify({
        projectId: id
    });
    $.ajax({
        type: "POST",
        url: "GeneralManagement.aspx/ToPdf",
        data: obj,
        dataType: "json",
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (response) {
            if (response.d != null || response.d != "") {
                armar(response.d);

            } else {

            }
        }
    });
}

function armar(html) {
    var objTo = document.getElementById('HTMLtoPDF')
    while (objTo.hasChildNodes())
        objTo.removeChild(objTo.firstChild);

    var divtest = document.createElement("div");
    divtest.setAttribute("class", "container");

    divtest.innerHTML += html;
    
    objTo.appendChild(divtest);
}

$(document).on('click', '#print', function (e) {
    e.preventDefault();
    $('.container').printThis({
            debug: false
        });
});
