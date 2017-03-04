$('.question-item:first').removeClass('inactive').addClass('focus');
$('.focus input, .focus textarea').focus();
$(document).keypress(function(event) {
    if (event.keyCode == 13 || event.which == 13) {
      $('.focus input, .focus textarea').blur();
      $('.focus').removeClass('focus').addClass('inactive').next().removeClass('inactive').addClass('focus');
      $('.focus input, .focus textarea').focus();
      $('html,body').scrollTop($('.focus').offset().top - 100);
      event.preventDefault();
    }
});

$('.question-item').click(function(e) {
      $('.focus input, .focus textarea').blur();
      $('.focus').removeClass('focus').addClass('inactive')
      $(this).removeClass('inactive').addClass('focus');
      $('.focus input, .focus textarea').focus();
      $('html,body').scrollTop($('.focus').offset().top - 100);
      e.preventDefault();
});

$('input, textarea').keypress(function(e) {
  if (e.keyCode != 13 || e.which != 13) {
      $('.focus .btn-enter').delay(300).fadeIn(600);
  };

});

$('input, textarea').keyup(function() {
  if (!this.value) {
    $('.focus .btn-enter').fadeOut(600);
  };
});


