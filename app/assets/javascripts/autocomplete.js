$( document ).ready(function() {
  $( "#nav-search" ).keypress(function() {
      console.log( "Pressed a key" );

       var text = $("input").val() 

    if (text.length > 3) {
      $.ajax({
          method: "GET",
          url: "/autocomplete",
          data: { search: text }
      })
    }

  });
});
