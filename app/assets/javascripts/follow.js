$( document ).ready(function() {
  showCorrectFollowButton();

  $( "#follow" ).click(function() {
    $.ajax({
      method: "POST",
      url: "/follow",
      data: { url: document.URL },
      success: function(place) {
       alert("Following!");
      }
    });
    showCorrectFollowButton();
  });
});

function showCorrectFollowButton() {
  $.ajax({
    method: "get",
    url: "/follow",
    data: { url: document.URL },
    success: function(follow) {
      debugger
      if (follow) {
        $('#following').toggleClass("hidden");
    		$('#follow').toggleClass("hidden");
      }
    }
  });
}
