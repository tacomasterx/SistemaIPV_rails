$(document).ready(function(){
  $('#product_product_type_id').on('change', function(event){
    event.preventDefault();
  //  console.log('Clicked ');

    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/product/options",
        data: {product_type_id: $('#product_product_type_id').val() },
        success: function(data){
           //console.log( data.length ) ;
           if(data.length >0 ){
             // Enable #x
             $( "#product_product_subtype_id" ).prop( "disabled", false );
             $('#product_product_subtype_id').html("");
             $('#product_product_subtype_id').append('<option selected="selected" value="0">Seleccione</option>');
             for (i = 0; i < data.length; i++) {
               $('#product_product_subtype_id').append('<option value="'+data[i].id+'">'+data[i].name+'</option>');
             }
           } else {
             // Disable #x
             $( "#product_product_subtype_id" ).prop( "disabled", true );
             $('#product_product_subtype_id').html('<option selected="selected" value="0">Seleccione</option>');
           }
         },
        error: function(data){ console.log('No funciona u.u\n' + data ) ; }
    });

  });
 });
