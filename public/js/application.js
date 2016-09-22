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
    }).done(function(response){
      var id = response
      $('#'+id).remove();
    });
  });
	$('.newAnswer').submit(function(){
		event.preventDefault();
		var thisForm = this
		var answerData = (this).serialize();
		var path = (this).attr('action');
		$.ajax({
			method: 'post',
			url: path,
			data: answerData,
		}).done(function(response) {
			$('.answerDisplay').append(response);
			$(thisForm).val("")
		});
	});
	$('.answerDisplay').on('submit', "#deleteAnswer", function(){
		event.preventDefault();
		var thisForm = this
		var path = $(this).attr('action');
		$.ajax({
			url: path,
			method: "delete"
		}).done(function(response) {
			$(thisForm).closest('#'+response).remove();
		});

	})
  $('.burger_button').on('click', function(event){
    $('.responsive_burger_button').toggleClass('expand')
  })































  $('#new_user_form').on('click', 'a', function(){
    event.preventDefault();
    var path = $(this).attr('action');
    $('.new_user').toggleClass('expand')
  });
  $('#login_form').on('click', 'a',function(){
    event.preventDefault();
    var path = $(this).attr('action');
    $('.log_in_user').toggleClass('expand')
  });

});
