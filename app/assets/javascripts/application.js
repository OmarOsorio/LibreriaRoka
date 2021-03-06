// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){


  $('#clavelibro').on("change",function() {
    //pasar a cantidad
    $("#cantidadlibro").focus();
  });

  $('#cantidadlibro').on("keypress",function(event) {
    //buscar el libro por codigo y agregarlo
    if ( event.which == 13)
    {
      agregaLibro($('#clavelibro').val());
    }
  });

  $("#guardarVenta").on("click", function(){
    //enviar formulario
    $("#new_sale").submit();
  });
 $('#Nombrecliente').on("keypress",function(event) {
    //buscar el cliente por nombre y agregarlo
    if ( event.which == 13)
    {
      //agregaLibro($('#clavelibro').val()); 
    //  alert("Hemos presionado para realizar busqueda de un cliente: " + $("#clavecliente").val().toLowerCase());
      var Nombrecliente = $("#Nombrecliente").val().toLowerCase();
      buscarCliente($("#Nombrecliente").val().toLowerCase());
    }
  });


});

function agregaLibro(Isbn){
  var index = $(".idLibroVender").length;

  //alert(index);

  if(Isbn == "" || Isbn == NaN)
  {
    alert("ingrese el código del libro.");
    $("#cantidadlibro").val(1);
    $('#clavelibro').focus();
    return;
  }

  $.ajax({
    dataType: "json",
    url: "http://localhost:3000/books/find.json?isbn=" + Isbn})
  .done(function(data) {                                            
      if(data.id == null){
        alert("No se encontró el libro.");
        resetAgregaLibro();
        return;
      }

         //80precio/100*20%      
      var descuento = ((data.precio / 100) * $("#descuentolibro").val());
      var totaldescuento = (descuento * $("#cantidadlibro").val());

        //var nuevoLibro ="<tr><td><input class=\"idLibroVender\" id=\"sale_detailsale_book_id\" name=\"sale[detailsale] ["+index+"][book_id]\" readonly=\"readonly\" type=\"text\" value=\"" + data.id  +"\"></td>    <td><input type=\"text\" id=\"nombreProducto\" value=\"" + data.titulo+ "readonly=\"readonly\"></td> <td><input class=\"cantidadLibro\" id=\"sale_detailsale_cantidad\" name=\"sale[detailsale]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\" ></td> <td><input class=\"precioLibro\" id=\"sale_detailsale_precioUnitario\" name=\"sale[detailsale] ["+index+"][precioUnitario]\" readonly=\"readonly\" type=\"text\" value=\"" + data.precio + "\"></td>                                                                                                                                                                                                                           <td><input class=\"descuentoProducto\" id=\"sale_detailsale_descuento\" name=\"sale[detailsale]["+index+"][descuento]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio / 100) * $("#descuentolibro").val()) + "\"></td>  <td><input class=\"importeTotal\" id=\"sale_detailsale_importe_total\" name=\"sale[detailsale]["+index+"][importe_total]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio * $("#cantidadlibro").val()) - (totaldescuento)) + "\"></td> </tr>";
        //var nuevoLibro="<tr><td><input class=\"idLibroVender\" id=\"sale_detailSales_attributes_0_books_id\" name=\"sale[detailSales_attributes]["+index+"][book_id]\" type=\"text\" value=\""+ data.id  +"\"></td>  <td><input type=\"text\" id=\"titulo\" value=\"" + data.titulo+"\"></td>  <td><input id=\"sale_detailSales_attributes_0_precio\" name=\"sale[detailSales_attributes]["+index+"][precio]\" type=\"text\" value=\""+ data.precio + "\"></td> <td><input class=\"cantidadVender\" id=\"sale_detailSales_attributes_0_cantidad\" name=\"sale[saleDetails_attributes]["+index+"][cantidad]\" type=\"text\" value=\""+ $("#cantidadlibro").val() + "\"></td>                                                                <td><input class=\"importeProducto\" id=\"sale_saleDetails_attributes_0_importe\" name=\"sale[detailSales_attributes]["+index+"][total]\" type=\"text\" value=\""+ (data.precio * $("#cantidadlibro").val()) - (totaldescuento)) + "\"></td>  </tr>"; //armar el nuevo producto a agregar
        //alert("Datos del libro:" + data.id + " Codigo: " + data.codigo);
       var nuevoLibro = "<tr><td><input class=\"idLibroVender\" id=\"sale_detailSales_attributes_0_books_id\" name=\"sale[detailSales_attributes]["+index+"][book_id]\" type=\"text\" value=\"" + data.id + "\"></td> <td><input type=\"text\" id=\"titulo\" value=\"" + data.titulo+"\"></td>                                                         <td><input id=\"sale_detailSales_attributes_0_precio\" name=\"sale[detailSales_attributes]["+index+"][precio]\" type=\"text\" value=\"" + data.precio + "\"></td> <td><input class=\"cantidadVender\" id=\"sale_detailSales_attributes_0_cantidad\" name=\"sale[saleDetails_attributes]["+index+"][cantidad]\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\"></td>     <td><input class=\"descuentoProducto\" id=\"sale_detailSales_attributes_0_descuento\" name=\"sale[saleDetails_attributes]["+index+"][descuento]\" type=\"text\" value=\"" + ((data.precio / 100) * $("#descuentolibro").val()) + "\"></td>        <td><input class=\"importeProducto\" id=\"sale_saleDetails_attributes_0_importe\" name=\"sale[detailSales_attributes]["+index+"][total]\" type=\"text\" value=\"" + (data.precio * $("#cantidadlibro").val()) + "\"></td> </tr>";

        $("#detallesVentaTable tbody").append(nuevoLibro);
        resetAgregaLibro();
        calculaTotales();
      }).fail(function(){
        resetAgregaLibro();
    });
  }

  function resetAgregaLibro(){
    $("#cantidadlibro").val("");
    $('#clavelibro').val("");
    $('#clavelibro').focus();
    $('#descuentolibro').val(0);
  }

  function calculaTotales(){
    var productos = 0;
    var descuento = 0;
    var importeTotal = 0;
    $(".cantidadVender").each(function(index){
      productos += parseInt($(this).val());
    });

    $(".importeProducto").each(function(index){
      importeTotal += parseFloat($(this).val());
    });

    $("#totalArts").html(productos);
    $("#importeTotalVenta").html(formatCurrency(importeTotal));

  }

  //funcion tomada de http://selfcontained.us/2008/04/22/format-currency-in-javascript-simplified/
  function formatCurrency(num) {
    num = isNaN(num) || num === '' || num === null ? 0.00 : num;
    return "$ "+parseFloat(num).toFixed(2);
}