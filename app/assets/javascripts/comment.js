$( document ).ready(function() {
  loadComments();

});

function loadComments() {
  $.ajax({
    method: "get",
    url: "/comments",
    data: { url: document.URL },
    success: function(comments) {
      debugger
      $.each(comments, function(index, comment) {
        renderComment(comment)
      })
    }
  });
}

function renderComment(comment) {
      $('#scroll').append(" <div id='standard-comment' class='sixteen wide column'> <div id='comment-container' class='ui centered grid'> <div id='votes' class='two wide center aligned column'> <a id=" + comment.id + "><i class='chevron large up icon upvote'></i></a> <a id=" + comment.id + "><i class='chevron large down icon downvote'></i></a> </div> <div id='text-container' class='fourteen wide "+ comment.sentiment + " column'> <h4 class='inline num'>NUM</h4> <p id='comment-text' class='inline'>" + comment.body + "</p> </div> </div> </div> ")
}
