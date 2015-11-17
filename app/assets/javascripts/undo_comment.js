$( document ).ready(function() {
  if ( $('#the-message').text() == "Comment Saved!") {
    $('#the-message').parent()
                     .append("<h3><a href='/comments/destroy'>Undo?</a></h3>")
  }
});
