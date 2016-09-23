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

	});
  $('.burger_button').on('click', function(event){
    $('.responsive_burger_button').toggleClass('expand')
  });
    $('.container').on('submit', '.newCommentButton', function(){
    event.preventDefault();
    var thisButton = event.target
    var path = $('.newCommentButton').attr('action');
    $.ajax({
      method: 'get',
      url: path,
    }).done(function(response) {
      $('.commentForm').append(response);
      $(thisButton).remove();
    });
  });
   $('.answerDisplay').on('submit', '.newCommentButton', function(){
    event.preventDefault();
    var path = $(event.target).attr('action');
    var thisButton = event.target
    $.ajax({
      method: 'get',
      url: path,
    }).done(function(response) {
      $(thisButton).next().append(response);
      $(thisButton).remove();
    });
  });
   $('.container').on('submit', '.newComment', function(){
    event.preventDefault();
    var path = $(event.target).attr('action');
    var thisForm = event.target
    var data = $(event.target).serialize();
    $.ajax({
      method: 'post',
      url: path,
      data: data,
    }).done(function(response) {
      $('.question_comment').append(response);
      $('.newComment').remove();
    });
   });  
  $('.answerDisplay').on('submit', '.newComment', function(){
    event.preventDefault();
    var path = $(event.target).attr('action');
    var thisForm = event.target
    var data = $(event.target).serialize();
    $.ajax({
      method: 'post',
      url: path,
      data: data,
    }).done(function(response) {
      $('.question_comment').append(response);
      $('.newComment').remove();
    });
   }); 






























  $('#new_user_form').on('click', 'a', function(){
    event.preventDefault();
    var path = $(this).attr('action');
    $('.new_user').toggleClass('expand')
  });

  $('#login_link').on('click', 'a',function(){
    event.preventDefault();
    $('log_in_user').toggleClass('.sub_menu')
  });

  $('#comment_up_vote').submit(function(event){
    event.preventDefault();
    event.stopPropagation();
    var thisForm = this;
    var postData = $(this).serialize();
    var path = $(this).closest('form').attr("action");
    alert(path);
  $.ajax({
    url: path,
    method: "post"
  }).done(function(response){
    $(thisForm).closest('article').find('#comment_total').text(response);
  });
});

  $('#comment_down_vote').submit(function(event){
    event.preventDefault();
    event.stopPropagation();
    var thisForm = this;
    var postData = $(this).serialize();
    var path = $(this).closest('form').attr("action");
    console.log(path);
  $.ajax({
    url: path,
    method: "post"
  }).done(function(response){
    $(thisForm).closest('article').find('#comment_total').text(response);
    $(thisForm).closest('article').find('#comment_down_vote').focus();
  });
});

});
