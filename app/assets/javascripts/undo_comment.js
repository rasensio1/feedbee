$( document ).ready(function() {
  if ( $('#the-message').text() == "Comment Saved!") {
    $('#the-message').parent().append("<a href='/comments/destory'>Undo?</a>")
  }
});
