$( document ).ready(function() {
  if ( $('#the-message').text() == "Comment Saved!") {
    $('#new-comment').parent()
                     .append("<h3><a href='/comments/destroy'>Undo last comment?</a></h3>")
  }
});
