$( document ).ready(function() {


  $( "#follow" ).click(function() {
    console.log("you pressed the follow button")

    $.ajax({
      method: "POST",
      url: "/follow",
      data: { url: document.URL },
      success: function(place) {
        console.log("Following...")
        console.log(place)
      }
    })
  });
});
