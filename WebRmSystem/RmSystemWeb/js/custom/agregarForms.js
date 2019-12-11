

function agregarformulariosseleccionados() {

    var objTo = document.getElementById('formulariosseleccionados')
    while (objTo.hasChildNodes())
        objTo.removeChild(objTo.firstChild);

    var divtest = document.createElement("table");
    divtest.setAttribute("class", "table striped m-b-20");
    divtest.innerHTML += '<thead><tr><th>Formulario</th><th>Link</th></tr></thead><tbody id="tbl_body_detalle">';

    var grid = document.getElementById("formularios");
    var checkBoxes = grid.getElementsByTagName("input");
    var indexbox = 0;
    var i = 0;
    $('#tbl_body_detalle tr').each(function () {
        var celdas = $(this).find('td');

        i++;
        var nombre = $(celdas[0]).text();
        var marcado = false; //$(celdas[1]).data

        if (checkBoxes[indexbox].checked) {
            marcado = true;
        }
        indexbox++;

        var asistentes = i == 1 ? '35' : '22';
        if (marcado) {
            divtest.innerHTML += '<tr><td>' + nombre + '</td><td>https://forms' + i + '.gle</td></tr>';
        }
    
    });

    divtest.innerHTML += '</tbody>';
    //divtest.innerHTML = '<thead><tr><th>Nombre</th><th>Cargo</th><th>Correo</th><th>Seleccionar</th></tr></thead><tbody id="table_body"><tr id="a" class="gradeX"><td>Juan Pablo</td><td>Auxiliar</td><td>jp@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_1" class="filled-in" /><label for="basic_checkbox_1"></label></td></tr><tr id="b" class="gradeC"><td>Jorge Chavez</td><td>Asistente</td><td>jc@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_2" class="filled-in" /><label for="basic_checkbox_2"></label></td></tr><tr id="c" class="gradeA"><td>Mariah Paz</td><td>Auxiliar</td><td>mm@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_3" class="filled-in" /><label for="basic_checkbox_3"></label></td></tr></tbody>';

    objTo.appendChild(divtest);
    //$("#formularioslista").hide();
    var objTo1 = document.getElementById('formulariosparaenviar')
    while (objTo1.hasChildNodes())
        objTo1.removeChild(objTo1.firstChild);

    var divtest1 = document.createElement("table");
    divtest1.setAttribute("class", "table striped m-b-20");
    divtest1.innerHTML += '<thead><tr><th>Formulario</th><th>Número de asistentes</th><th>Confirmados</th><th>Link</th><th>Seleccionar</th></tr></thead><tbody id="tbl_body_detalle">';

    var grid1 = document.getElementById("formularios");
    var checkBoxes1 = grid1.getElementsByTagName("input");
    var indexbox1 = 0;
    var j = 0;
    $('#tbl_body_detalle tr').each(function () {
        var celdas1 = $(this).find('td');

        j++;
        var nombre1 = $(celdas1[0]).text();
        var marcado1 = false; //$(celdas[1]).data

        if (checkBoxes1[indexbox1].checked) {
            marcado1 = true;
        }
        indexbox1++;

        var asistentes1 = j == 1 ? '35' : '22';
        if (marcado1) {
            divtest1.innerHTML += '<tr><td>' + nombre1 + '</td><td>' + asistentes1 + '</td><td>0</td><td>https://forms' + j + '.gle</td><td style="text-align-last: center;"><input type="checkbox" id="bcde' + j + '" class="filled-in" /><label for="bcde' + j + '"></label></td></tr>';
        }

    });

    divtest1.innerHTML += '</tbody>';
    //divtest.innerHTML = '<thead><tr><th>Nombre</th><th>Cargo</th><th>Correo</th><th>Seleccionar</th></tr></thead><tbody id="table_body"><tr id="a" class="gradeX"><td>Juan Pablo</td><td>Auxiliar</td><td>jp@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_1" class="filled-in" /><label for="basic_checkbox_1"></label></td></tr><tr id="b" class="gradeC"><td>Jorge Chavez</td><td>Asistente</td><td>jc@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_2" class="filled-in" /><label for="basic_checkbox_2"></label></td></tr><tr id="c" class="gradeA"><td>Mariah Paz</td><td>Auxiliar</td><td>mm@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_3" class="filled-in" /><label for="basic_checkbox_3"></label></td></tr></tbody>';

    objTo1.appendChild(divtest1);
}
