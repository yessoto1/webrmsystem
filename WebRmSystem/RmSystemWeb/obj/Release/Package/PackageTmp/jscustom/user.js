loadUsers();

var tablaUser;

function loadUsers() {
    $.ajax({
        type: "POST",
        url: "AdminUsers.aspx/ListUsers",
        data: {},
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#tbl_usuarios").DataTable().destroy();
            llenar(data.d);
        }
    });
}

function llenar(data) {
    tablaUser = $('#tbl_usuarios').DataTable({
        //data: data,
        "aaSorting": [[0, 'desc']],
        "bSort": true,
        columns: [
            null,
            null,
            null,
            { "bSortable": false }
        ]
    });

    tablaUser.clear();

    for (var i = 0; i < data.length; i++) {
        tablaUser.row.add([
            data[i].USER_ID,
            data[i].FULL_NAME,
            data[i].EMAIL,
            '<button class="btn waves-effect waves-light" style="width: 40px; background-color: #0c5460; color: #FFFFFF;" title="Editar" id="btnEditarUser""><i class="fas fa-pen"></i></button> ' +
            '<button class="btn btn-danger waves-effect waves-light" style="width: 40px;" title="Eliminar" id="btnEliminarUser"><i class="fas fa-times"></i></button> '
        ]).draw(false);
    }
}

$("#btnGuardarUsuario").click(function (e) {
    e.preventDefault();
    saveUser();
    $("#modal_nuevo_colaborador").modal('toggle');
    loadUsers();
});

function saveUser() {
    var obj = JSON.stringify({
        firstName: $("#txtFirstName").val(),
        lastName: $("#txtLastName").val(),
        email: $("#txtEmailUser").val(),
        password: $("#txtPasswordUser").val()
    });

    $.ajax({
        type: "POST",
        url: "AdminUsers.aspx/SaveUser",
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

//eliminar
$(document).on('click', '#btnEliminarUser', function (e) {
    e.preventDefault();
    $("#modal_eliminar_usuario").modal();
    var datos = tablaUser.row($(this).parents("tr")).data();
    //console.log(datos);
    var codigoUsuario = JSON.stringify(datos[0]);
    document.getElementById("lblIdUsuario").innerHTML = codigoUsuario;
});

$(document).on('click', '#btnConfirmarEliminar', function (e) {
    e.preventDefault();
    var id=document.getElementById("lblIdUsuario").innerHTML;
    deleteUser(id);
    $('#modal_eliminar_usuario').modal('hide');
});

function deleteUser(id) {
    var obj = JSON.stringify({
        userId: id
    });
    $.ajax({
        type: "POST",
        url: "AdminUsers.aspx/DeleteUser",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#tbl_usuarios").DataTable().destroy();
            loadUsers();
        }
    });
}

//Editar
$(document).on('click', '#btnEditarUser', function (e) {
    e.preventDefault();
    var datos = tablaUser.row($(this).parents("tr")).data();
    var codigoUsuario = JSON.stringify(datos[0]);
    getUserById(codigoUsuario);
    
    //llenar modal
    //
   
});

function getUserById(id) {
    var obj = JSON.stringify({
        userId: id
    });
    $.ajax({
        type: "POST",
        url: "AdminUsers.aspx/GetUserById",
        data: obj,
        contentType: 'application/json; charset=utf-8',
        error: function (xhr, ajaxOptions, thrownError) {
            console.log(xhr.status + " \n" + xhr.responseText, "\n" + thrownError);
        },
        success: function (data) {
            $("#modal_editar_colaborador").modal();
            var codigoUsuario = data.d.USER_ID;
            var firstNameUsuario = data.d.FIRST_NAME;
            var lastNameUsuario = data.d.LAST_NAME;
            var emailUsuario = data.d.EMAIL;
            document.getElementById("lblUserIdModal").innerHTML = codigoUsuario;
            document.getElementById("txtFirstNameModal").value = firstNameUsuario;
            document.getElementById("txtLastNameModal").value = lastNameUsuario;
            document.getElementById("lblCorreoModal").innerHTML = emailUsuario;
            //llenar modal
        }
    });
}
//btnGuardarUsuarioEditado
$(document).on('click', '#btnGuardarUsuarioEditado', function (e) {
    e.preventDefault();
    var id = document.getElementById("lblUserIdModal").innerHTML;
    var fistName = document.getElementById("txtFirstNameModal").value;
    var lastName = document.getElementById("txtLastNameModal").value;
    var pass = document.getElementById("txtPswModal").value;
    updateUser();
    $("#modal_editar_colaborador").modal('toggle');
    loadUsers();
    //guardar

});

function updateUser() {
    var obj = JSON.stringify({
        userId: document.getElementById("lblUserIdModal").innerHTML,
        firstName: $("#txtFirstNameModal").val(),
        lastName: $("#txtLastNameModal").val(),
        password: $("#txtPswModal").val()
    });

    $.ajax({
        type: "POST",
        url: "AdminUsers.aspx/UpdateUser",
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
