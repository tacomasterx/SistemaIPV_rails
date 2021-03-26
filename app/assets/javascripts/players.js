$(document).ready(function(){
  $('input[type=submit]').on('click', function(event){
    var form = $('#edit-form');
    event.preventDefault();
    console.log('Cadena rara: ' + form.serialize() );

    // $.ajax({
    //     type: "GET",
    //     dataType: "json",
    //     url: "/player/test",
    //     data: {some_parameter: 2},
    //     success: function(data){ console.log( data.name ) ; },
    //     error: function(data){ console.log('No funciona u.u\n' + data.name) ; }
    // });

      $.ajax({
        type: 'PUT',
        url: form.attr('action'),
        data: form.serialize(),
        success: function(data){
          if (data.linked_to_steroids == true) {
            console.log(data.name + " is linked to steroids.");
            $('#linked').html("true");
          } else {
            console.log(data.name + " is no longer linked to steroids.");
            $('#linked').html("false");
          }
        },
        error: function(data){
          console.log('there seems to be an error.');
        },
        dataType: 'JSON'
  });

 });
});
