$( document ).ready(function() {
  loadComments();
});

function loadComments() {
  $("#scroll").children().remove();
  $.ajax({
    method: "get",
    url: "/comments",
    data: { url: document.URL },
    success: function(comments) {
      $.each(comments, function(index, comment) {
        renderComment(comment)
      })
      readyVotes()
    }
  });
}

function renderComment(comment) {
      $('#scroll').append(" <div id='standard-comment' class='sixteen wide column'> <div id='comment-container' class='ui centered grid'> <div id='votes' class='two wide center aligned column'> <a id=" + comment.id + "><i class='chevron large up icon upvote'></i></a> <a id=" + comment.id + "><i class='chevron large down icon downvote'></i></a> </div> <div id='text-container' class='fourteen wide "+ comment.sentiment + " column'> <h4 class='inline num'>"+ comment.vote_count +"</h4> <p id='comment-text' class='inline'>" + comment.body + "</p> </div> </div> </div> ")
}

function readyVotes() {
  $( ".upvote" ).click(function() {
    var commentId = $(this).parent().attr("id");
    $.ajax({
      method: "POST",
      url: "/votes",
      data: { value: 1,
              comment_id: commentId },
      success: function() { loadComments(); }
    });
  });

  $(".downvote").click(function() {
    var commentId = $(this).parent().attr("id");
    $.ajax({
      method: "POST",
      url: "/votes",
      data: { value: -1,
              comment_id: commentId },
      success: function() { loadComments(); }
    });
  });
}
