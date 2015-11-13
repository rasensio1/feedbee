$( document ).ready(function() {
  displayMessages();
});

function displayMessages() {
  if ( $('#the-message').text() != "") {
    $('.ui.modal').modal('show') ;
  }
}
