
function formulario_nuevo() {

    var preguntas = document.getElementById('education_fields');
    //var opciones = document.getElementById('education_fields');

    for (var i = 0; i < preguntas.childElementCount; i++) {
        //var a = preguntas.getAttribute("pregunta").[i];
        var element = "";
        element = "holaaa";
    }

    var descrip = $("#descripcion").val();
    var objTo = document.getElementById('formulario');

    while (objTo.hasChildNodes())
        objTo.removeChild(objTo.firstChild);

    var divtest = document.createElement("form");
    divtest.setAttribute("class", "form-horizontal");

    divtest.innerHTML = '<div class="form-group"  style="text-align:center;"><h2>' + descrip + '</h2></div>';

    objTo.appendChild(divtest);
}	