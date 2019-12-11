var listaMascotasDb = [];

function llenar_body() {

    var db = {

        loadData: function (filter) {
            return $.grep(this.mascotas, function (mascota) {
                return (!filter.Nombre || mascota.Nombre.indexOf(filter.Nombre) > -1)
                    && (!filter.Cargo || mascota.Cargo.indexOf(filter.Cargo) > -1)
                    && (!filter.Correo || mascota.Correo.indexOf(filter.Correo) > -1);
            });
        },

        insertItem: function (insertingClient) {
            this.clients.push(insertingClient);
        },

        updateItem: function (updatingClient) { },

        deleteItem: function (deletingClient) {
            var clientIndex = $.inArray(deletingClient, this.clients);
            this.clients.splice(clientIndex, 1);
        }

    };

    window.db = db;

    var lista = [
        {
            "Nombre": "Jorge Chavez",
            "Cargo": "Asistente",
            "Correo": "jc@ransa.net"
        },
        {
            "Nombre": "Juan Pablo",
            "Cargo": "Auxiliar",
            "Correo": "jp@ransa.net"
        },
        {
            "Nombre": "Mariah Paz",
            "Cargo": "Auxiliar",
            "Correo": "mm@ransa.net"
        }
    ]
    
    db.mascotas = lista;
};