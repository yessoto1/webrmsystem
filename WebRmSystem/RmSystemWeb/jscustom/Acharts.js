﻿$("#btnConsultarReporte").click(function (e) {
    e.preventDefault();
    loadData1();
    loadData2();
});

function loadData1() {
    var obj = JSON.stringify({
        desde: $("#ddlDesde").val(),
        hasta: $("#ddlHasta").val()
    });
    $.ajax({
        type: "POST",
        url: "AdminReportes.aspx/lista1",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            llenar1(data.d);
        }
    });
}

function loadData2() {
    var obj = JSON.stringify({
        desde: $("#ddlDesde").val(),
        hasta: $("#ddlHasta").val()
    });
    $.ajax({
        type: "POST",
        url: "AdminReportes.aspx/lista2",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            llenar2(data.d);
        }
    });
}

function llenar1(estados) {
    new Chart(document.getElementById("chart2"),
        {
            "type": "bar",
            "data": {
                "labels": ["Abierto", "Cerrado"],
                "datasets": [{
                    "label": "Riesgos",
                    "data": estados,
                    "fill": false,
                    "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"],
                    "borderColor": ["rgb(252, 75, 108)", "rgb(255, 159, 64)", "rgb(255, 178, 43)", "rgb(38, 198, 218)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"],
                    "borderWidth": 1
                }
                ]
            },
            "options": {
                "scales": { "yAxes": [{ "ticks": { "beginAtZero": true } }] }
            }
        });
}

function llenar2(tipos) {
    new Chart(document.getElementById("chart3"),
        {
            "type": "pie",
            "data": {
                "labels": ["Logístico", "Operativo"],
                "datasets": [{
                    "label": "My First Dataset",
                    "data": tipos,
                    "backgroundColor": ["rgb(252, 75, 108)", "rgb(30, 136, 229)", "rgb(255, 178, 43)"]
                }
                ]
            }
        });
}
inicializarRangos();
function inicializarRangos() {
    var hoy = new Date();
    var dd = hoy.getDate();
    var mm = hoy.getMonth() + 1;
    var yyyy = hoy.getFullYear();

    $("#ddlDesde").val(mm);
    $("#ddlHasta").val(mm);

    loadData1();
    loadData2();
}

$(document).on('click', '#print2', function (e) {
    e.preventDefault();
    $('#sectionReportes').printThis({
        debug: false
    });
});
