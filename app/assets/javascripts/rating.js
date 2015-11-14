$( document ).ready(function() {
  var myRating = $('.rating').attr("data-rating");
  $('.ui.rating')
    .rating({
      initialRating: myRating,
      maxRating: 5
    });
});

