$(document).ready(function() {

  $(".upvote").click(function() {
    var commentId = $(this).parent().attr("id");
    $.ajax({
      method: "POST",
      url: "/votes",
      data: { value: 1,
              comment_id: commentId },
    });
  });

  $(".downvote").click(function() {
    var commentId = $(this).parent().attr("id");
    $.ajax({
      method: "POST",
      url: "/votes",
      data: { value: -1,
              comment_id: commentId },
    });
  });
});



