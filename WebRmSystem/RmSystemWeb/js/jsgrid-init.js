! function (document, window, $) {
    "use strict";
    var Site = window.Site;
    $(document).ready(function ($) {

    }), jsGrid.setDefaults({
        tableClass: "jsgrid-table table table-striped table-hover"
    }), jsGrid.setDefaults("text", {
        _createTextBox: function () {
            return $("<input>").attr("type", "text").attr("class", "form-control input-sm")
        }
    }), jsGrid.setDefaults("number", {
        _createTextBox: function () {
            return $("<input>").attr("type", "number").attr("class", "form-control input-sm")
        }
    }), jsGrid.setDefaults("textarea", {
        _createTextBox: function () {
            return $("<input>").attr("type", "textarea").attr("class", "form-control")
        }
    }), jsGrid.setDefaults("control", {
        _createGridButton: function (cls, tooltip, clickHandler) {
            var grid = this._grid;
            return $("<button>").addClass(this.buttonClass).addClass(cls).attr({
                type: "button",
                title: tooltip
            }).on("click", function (e) {
                clickHandler(grid, e)
            })
        }
    }), jsGrid.setDefaults("select", {
        _createSelect: function () {
            var $result = $("<select>").attr("class", "form-control input-sm"),
                valueField = this.valueField,
                textField = this.textField,
                selectedIndex = this.selectedIndex;
            return $.each(this.items, function (index, item) {
                var value = valueField ? item[valueField] : index,
                    text = textField ? item[textField] : item,
                    $option = $("<option>").attr("value", value).text(text).appendTo($result);
                $option.prop("selected", selectedIndex === index)
            }), $result
        }
    }),
        function () {
            $("#basicgrid").jsGrid({
                height: "500px", /* tamaño de la tabla de mascotas */
                width: "100%",
                filtering: !0,
                editing: !0,
                sorting: !0,
                paging: !0,
                autoload: !0,
                pageSize: 15,
                pageButtonCount: 5,
                deleteConfirm: "Do you really want to delete the client?",
                controller: db,
                fields: [{
                    name: "Nombre",
                    type: "text",
                    width: 150
                }, {
                    name: "Cargo",
                    type: "text",
                    width: 150
                }, {
                    name: "Correo",
                    type: "text",
                    width: 150
                },
                {
                    type: "control"
                }]
            })
        }()
}(document, window, jQuery);