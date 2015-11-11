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

  $( "#following" ).click(function() {
    $.ajax({
      method: "DELETE",
      url: "/follow",
      data: { url: document.URL },
      success: function() {
      }
    });
    $('#following').toggleClass("hidden");
    $('#follow').toggleClass("hidden");
  });
});

function showCorrectFollowButton() {
  $.ajax({
    method: "get",
    url: "/follow",
    data: { url: document.URL },
    success: function(follow) {
      if (follow) {
        $('#following').toggleClass("hidden");
    		$('#follow').toggleClass("hidden");
      }
    }
  });
}
