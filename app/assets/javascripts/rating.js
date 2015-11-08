$( document ).ready(function() {
  $('.ui.rating')
    .rating({
      initialRating: 3,
      maxRating: 5
    });

  $('.ui.rating')
    .rating('disable') ;
});
