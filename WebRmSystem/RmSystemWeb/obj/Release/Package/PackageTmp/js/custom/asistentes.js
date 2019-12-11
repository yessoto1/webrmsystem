var room = 1;

function llenar_body() {
    room++;
    var objTo = document.getElementById('div_asistentes')

    while (objTo.hasChildNodes())
        objTo.removeChild(objTo.firstChild);

    var divtest = document.createElement("table");
    divtest.setAttribute("class", "table striped m-b-20");
    //var rdiv = 'removeclass' + room;
    divtest.innerHTML = '<thead><tr><th>Nombre</th><th>Cargo</th><th>Correo</th><th>Seleccionar</th></tr></thead><tbody id="table_body"><tr id="a" class="gradeX"><td>Juan Pablo</td><td>Auxiliar</td><td>jp@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_1" class="filled-in" /><label for="basic_checkbox_1"></label></td></tr><tr id="b" class="gradeC"><td>Jorge Chavez</td><td>Asistente</td><td>jc@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_2" class="filled-in" /><label for="basic_checkbox_2"></label></td></tr><tr id="c" class="gradeA"><td>Mariah Paz</td><td>Auxiliar</td><td>mm@ransa.net</td><td style="text-align-last: center;"><input type="checkbox" id="basic_checkbox_3" class="filled-in" /><label for="basic_checkbox_3"></label></td></tr></tbody>';

    objTo.appendChild(divtest);
}	