﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.ConsumoLocalStock.View" %>


<style>
@import url('https://fonts.googleapis.com/css?family=Roboto');
</style> 


<!-- MODULO -->
<div>

    <!-- TITULO -->
    <h1>ASIGNAR STOCK A TRATAMIENTO</h1>

    <div  style="display:inline-block">
        <!-- BUSCADOR DE PRODUCTO ORIGEN -->
        <div class="Busqueda" id="buscadorProducto">
        
            <!-- TextBox para ingresar la cadena de búsqueda -->
                BUSCAR PRODUCTO <asp:TextBox
                style="margin-left:5px;"
                runat="server"
                clientIdMode="Static"
                ID="txtBuscadorProducto"></asp:TextBox> <br />

            <!-- Tabla de resultados -->
            <table id="tablaProductos">
                <tr>
                    <th>DESCRIPCION</th>
                    <th>CANITDAD</th>
                </tr>
            </table>

        </div>
    </div>

    <div style="display:inline-block; margin-left:150px;">
        <!-- BUSCADOR DE TRATAMIENTOS -->
        <div class="Busqueda" id="buscadorTratamiento">
        
            <!-- TextBox para ingresar la cadena de búsqueda -->
                BUSCAR TRATAMIENTO <asp:TextBox
                style="margin-left:5px;"
                runat="server"
                clientIdMode="Static"
                ID="txtBuscadorTratamiento"></asp:TextBox> <br />


            <!-- Tabla de resultados -->
            <table id="tablaTratamiento">
                <tr>
                    <th>NOMBRE</th>
                    <th>DESCRIPCION</th>
                </tr>
            </table>

        </div>
    </div>


</div>


<!-- POP UP -->
<div>
    <!-- CONFIRMAR TRANSF -->
    <div title="CONFIRMAR" id="confirmacionPopUp">

        <div class="Busqueda" id="confirmacionTxt">
            <input type="button" class="FormButton" value="GUARDAR" onclick="guardarDatos()"/>
            <input id="cantTxt" type="text" style="height:39.5px; margin-left:-2px;" placeholder="Ingrese cantidad." />
            <table id="tablaResumen">
                <tr>
                    <th>PRODUCTO</th>
                    <th></th>
                    <th>TRATAMIENTO</th>
                </tr>
            </table>
        </div>
    </div>

    <div class="Busqueda" id="stockAsociadoPopUp" title="STOCK ASOCIADO">
        <!-- Tabla stock asociado -->
        <table id="TablaStockAsociado">

        </table>
    </div>

</div>






<!-- HIDDENS -->
<!-- URL -->
<asp:HiddenField runat="server" ID="url" ClientIDMode="Static" />
<!-- Local -->
<asp:HiddenField Id="id" runat="server" ClientIDMode="Static" />
<!-- ID de producto y de tratamiento -->
<input type="hidden" id="idHidden" />
<!-- Nombre de producto-->
<input type="hidden" id="productoNombreHidden" />
<!-- Nombre Tratamiento -->
<input type="hidden" id="tratamientoNombreHidden" />

<script>



    function abrirStockAsociadoPopUp(object) {
        vaciarTablaSA();
        agregarDatosTabla($(object).val(), 'Piedras', '5')
        stockAsociadoPopUp.dialog('open')
    }


    //-----     HIDDENS     -----
    function guardarDatos() {
        var url = $('#url').val()
        var idL = $('#id').val()
        var ids = $('#idHidden').val()
        var cant = $('#cantTxt').val()

        if (isNaN(cant) || cant == '') {
            alert('Ingrese una cantidad correcta.')
        }
        else {
            window.location.href = url + '?idL=' + idL + '&ids=' + ids + '&cant=' + cant
        }               
    }

    //-----     DIALOGOS     -----
    //
    //Creación del diálogo de CONFIRMACIÓN
    var confirmarPopUp = $('#confirmacionPopUp').dialog({
        autoOpen: false,
        closeOnEscape: false,
        modal: true,
        dialogClass: 'dnnFormPopup',
        resizable: false,
        draggable: false,
        width: 'auto',
        show: 'blind',
        hide: 'blind',
        closeOnEscape: true,
    });
    //
    //Ceración del diálogo de STOCK ASOCIADO
    var stockAsociadoPopUp = $('#stockAsociadoPopUp').dialog({
        autoOpen: false,
        closeOnEscape: false,
        modal: true,
        dialogClass: 'dnnFormPopup',
        resizable: false,
        draggable: false,
        width: 'auto',
        show: 'blind',
        hide: 'blind',
        closeOnEscape: true,
        close: {
            function(event, ui) {
                $('#TablaStockAsociado').empty()
            }
        },
    });

    //-----     TABLAS     -----
    //
    //Funciones para manejar la tabla de STOCK ASOCIADO
    function vaciarTablaSA() {
        $('#TablaStockAsociado').empty()
    }
    function agregarDatosTabla(nombreTrat, nombreStock, cantStock) {
        $('#TablaStockAsociado').append('<tr><th>' + nombreTrat + '</th></tr><tr><td>' + nombreStock + '</td><td>' + cantStock + '</td></tr>')
    }
    //
    //Funciones para manejar la tabla de RESUMEN
    function vaciarTablaR() {
        $('#tablaResumen').empty();
    }
    function reconstruirTablaR() {
        $('#tablaResumen').append('<tr><th>PRODUCTO</th><th></th><th>TRATAMIENTO</th></tr>')
    }
    function agregarDatosTablaR() {
        $('#tablaResumen').append('<tr><td>' + $('#productoNombreHidden').val() + '</td><td>→</td><td>' + $('#tratamientoNombreHidden').val() + '</td></tr>')
    }

    




    //-----     AJAX     -----
    //
    //Ejecuta la función de buscar TRATAMIENTOS al presionar tecla
    $('#txtBuscadorTratamiento').keyup(function () {
        if ($('#txtBuscadorTratamiento').val() != "") {
            clickBotonTratamiento();
        }
        else null;
        
    });
    //    
    //Ejecuta la función de buscar ARTÍCULOS al presionar tecla
    $('#txtBuscadorProducto').keyup(function () {
        if ($('#txtBuscadorProducto').val() != "") {
            clickBotonProducto();
        }
        else null;
        
    });
    //
    //Buscador de ARTÍCULOS
    function clickBotonTratamiento() {
        $.ajax({
            url: "/DesktopModules/ConsumoLocalStock/WebService.aspx",
            success: function (data) {
                if (data != "null") {
                    $('#tablaTratamiento').empty();
                    $('#tablaTratamiento').append('<tr><th>NOMBRE</th><th>DESCRIPCION</th></tr>');
                    for (a = 0; a < data.length; a++) {

                        $('#tablaTratamiento').append('<tr id="' + data[a].Id + '" class="droppable"><td><input style="background:none;border:none" onclick="abrirStockAsociadoPopUp(this)" type="button" value="' + data[a].Nombre + '" /></td><td>' + data[a].Descripcion + '</td></tr>')
                    }
                    ajaxData = data;
                }
                //Definición del elemento droppable
                $('.droppable').droppable({
                    drop: function (event, ui) {

                        //Se obtiene el string compuesto por ambos ID (producto y tratamiento)
                        var string = $(ui.draggable).attr('id') + '*' + $(this).attr('id')
                        $('#idHidden').val(string)  //Se guarda el string en un hidden
                        console.log(string) //Se registra en la consola para testear
                        //Se obtiene el text del draggable
                        $('#productoNombreHidden').val($(ui.draggable).text())  //Se guarda el string en un hidden
                        console.log('PRODUCT: ' + $(ui.draggable).text())   //Se registra en la consola para testear
                        //Se obtiene el text del droppable
                        $('#tratamientoNombreHidden').val($(this).find('input').val())    //Se guarda el string en un hidden
                        console.log('TREAT: ' + $(this).find('input').val())  //Se registra en la consola para testear

                        vaciarTablaR()
                        reconstruirTablaR()
                        agregarDatosTablaR()

                        confirmarPopUp.dialog('open');
                        
                    }
                })
            },
            dataType: 'json',
            data:
                {
                    buscarT: $('#txtBuscadorTratamiento').val(),
                    id: $('#id').val()
                }

        });
    }
    //
    //Buscador de ARTÍCULOS
    function clickBotonProducto() {
        $.ajax({
            url: "/DesktopModules/ConsumoLocalStock/WebService.aspx",
            success: function (data) {
                if (data != "null") {
                    $('#tablaProductos').empty();
                    $('#tablaProductos').append('<tr><th>DESCRIPCION</th><th>CANTIDAD</th></tr>');
                    for (a = 0; a < data.length; a++) {
                    
                        $('#tablaProductos').append('<tr><td id="' + data[a].Id + '" class="draggable" >' + data[a].Descripcion + '</td><td>' + data[a].CantidadINT + '</td></tr>')
                    }
                    ajaxData = data;
                }
                //Definición del draggable
                $('.draggable').draggable({
                    //Propiedades
                    opacity: 0.5,
                    revert: true,
                    revertDuration: 500,


                })
            },
            dataType: 'json',
            data:
                {
                    buscarP: $('#txtBuscadorProducto').val(),
                    id: $('#id').val()
                }

        });
    }


</script>
