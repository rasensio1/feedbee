$( document ).ready(function() {

  $( "#nav-search" ).keypress(function() {
    console.log("you pressed a key")
     var text = $('input').filter('#nav-search').val() 

    if (text.length > 2) {
      $.ajax({
        method: "GET",
        url: "/autocomplete.json",
        data: { search: text },
        success: function(raw_places) {
          var content = setValues(raw_places)
          $('.ui.search').search({
              source: content
            });
        }
      })
    }
  });
});


function setValues(raw_places) {
  var format = getKeys(raw_places).map(function(text){
      return {title: text}
  })
  return format
}

function getKeys(raw_places) {
  return Object.keys(raw_places)
}

