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
});
