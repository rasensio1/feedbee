$( document ).ready(function() {
  $( "#nav-search" ).keypress(function() {
    console.log("you pressed a key")
     var text = $("input").val() 

    if (text.length > 3) {
      $.ajax({
        method: "GET",
        url: "/autocomplete.json",
        data: { search: text },
        success: function(json) {
           console.log(json)
        }
      })
    }
  });

  $('#nav-search').bind("enterKey",function(e){
     var text = $("input").val() 

    console.log("you hit enter")

      $.ajax({
        method: "GET",
        url: "/show",
        data: { go_to: text },
        success: function(json) {
           console.log(json)
        }
      })
   });

   $('#nav-search').keyup(function(e){
     if(e.keyCode == 13) {
       $(this).trigger("enterKey");
     }
   });

});
