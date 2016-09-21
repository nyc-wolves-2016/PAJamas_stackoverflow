$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.container').on('submit', '.delete_question', function(event) {
    event.preventDefault();
    $.ajax({
      url: $(event.target).attr('action'),
      method: "delete"
    }).done(function(){
      var id = $(event.target).closest('li').attr('id')
      $('#'+id).remove();
    });
  });
});
