$( document ).ready(function() {
  $('#sentiment-button')
    .popup({
        inline   : true,
        hoverable: true,
        position : 'top right',
      }) ;
  $("#good").click(function(){
    $("#sentiment").val(1)
  });

  $("#bad").click(function(){
    $("#sentiment").val(0)
  })

});
