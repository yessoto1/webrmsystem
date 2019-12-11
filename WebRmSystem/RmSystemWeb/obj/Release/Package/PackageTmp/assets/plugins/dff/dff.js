var room = 0;
var roomOptions = 0;

function education_fields() {

    room++;
    var objTo = document.getElementById('education_fields')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "form-group removeclass" + room);
    var rdiv = 'removeclass' + room;
    //divtest.innerHTML = '<div class="row"><div class="col-sm-6 nopadding"><input type="text" class="form-control" id="pregunta" name="Schoolname[]" value="" placeholder="Escribe la pregunta"></div><div class="col-sm-4 nopadding"><div class="form-group"><div class="input-group"><select class="form-control" id="tipoPregunta" name="educationDate[]"><option value="unico">Respuesta única</option><option value="multiple">Selección múltiple</option><option value="verificacion">Casillas de verificación</option><option value="desplegable">Desplegable</option></select><div class="input-group-append"><button class="btn btn-danger" type="button" onclick="remove_education_fields(' + room + ');"><i class="ti-minus"></i></button></div></div></div></div><div class="clear"></div></div><div class="row"><div class="col-sm-6 nopadding"><asp:Label Text="Opciones" runat="server" /></div></div><div id="options' + room + '"></div><div class="row"><div class="col-sm-3 nopadding"><div class="form-group"><button class="btn btn-info btn-circle" type="button" title="Agregar opción" onclick="add_options(' + room + ');"><i class="ti-plus"></i></button></div></div></div>';
    divtest.innerHTML = '<div class="card"><div class="card-body"><div class="row"><div class="col-sm-6 nopadding"><input type="text" class="form-control" id="pregunta" name="Schoolname[]" value="" placeholder="Escribe la pregunta"></div><div class="col-sm-4 nopadding"><div class="form-group"><div class="input-group"><select class="form-control" id="tipoPregunta" name="educationDate[]"><option value="unico">Respuesta única</option><option value="multiple">Selección múltiple</option><option value="verificacion">Casillas de verificación</option><option value="desplegable">Desplegable</option></select><div class="input-group-append"><button class="btn btn-danger" type="button" onclick="remove_education_fields(' + room + ');"><i class="fas fa-minus"></i></button></div></div></div></div><div class="clear"></div></div><div class="row"><div class="col-sm-6 nopadding"><asp:Label Text="Opciones" runat="server" /></div></div><div id="options' + room + '"></div><div class="row"><div class="col-sm-3 nopadding"><div class="form-group"><button class="btn btn-info btn-circle" type="button" title="Agregar opción" onclick="add_options(' + room + ');"><i class="fas fa-plus"></i></button></div></div></div></div></div>';

    objTo.appendChild(divtest);
}

function remove_education_fields(rid) {
    $('.removeclass' + rid).remove();
}

function add_options(index) {

    roomOptions++;
    var objToOptions = document.getElementById('options' + index)
    var divtestOptions = document.createElement("div");
    divtestOptions.setAttribute("class", "form-group removeclassOptions" + roomOptions);
    var rdiv = 'removeclass' + roomOptions;
    divtestOptions.innerHTML = '<div class="row"><div class="col-sm-6 nopadding"><ul class="list-icons"><li><div class="input-group"><input type="text" placeholder="Digitar opción" class="form-control" id="aa" value=""><div class="input-group-append"><button class="btn btn-warning" type="button" onclick="remove_options(' + roomOptions + ');"><i class="fas fa-times"></i></button></div></div></li></ul></div></div>';
    objToOptions.appendChild(divtestOptions);
}

function remove_options(rid) {
    $('.removeclassOptions' + rid).remove();
}