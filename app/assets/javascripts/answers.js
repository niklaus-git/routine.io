var choices = [],
    choice_value;

$('.question-item:first').removeClass('inactive').addClass('focus');
$('.focus input, .focus textarea').focus();
$(document).keydown(function(event) {
    if (event.keyCode == 13 || event.which == 13 ) {
      if (!event.shiftKey) {
        event.preventDefault();
      }
      if (!$('.focus').is(':last-child')) {
        if (!event.shiftKey) {
          $('.focus input, .focus textarea').blur();
          $('.focus .btn-enter').fadeOut();
          $('.focus').removeClass('focus').addClass('inactive').next().removeClass('inactive').addClass('focus');
          $('.focus input, .focus textarea').focus();
          $('html,body').scrollTop($('.focus').offset().top - 100);
          $('#routine-preview').scrollTop($('.focus').offset().top);
        }
      }
    } else if (!$('.focus').is(':last-child') && (event.keyCode == 40 || event.which == 40)) {
        $('.focus input, .focus textarea').blur();
            $('.focus .btn-enter').fadeOut();
            $('.focus').removeClass('focus').addClass('inactive').next().removeClass('inactive').addClass('focus');
            $('.focus input, .focus textarea').focus();
            $('html,body').scrollTop($('.focus').offset().top - 100);
            $('#routine-preview').scrollTop($('.focus').offset().top);
    } else if (!$('.focus').is(':first-child') && (event.keyCode == 38 || event.which == 38)) {
      $('.focus input, .focus textarea').blur();
      $('.focus .btn-enter').fadeOut();
      $('.focus').removeClass('focus').addClass('inactive').prev().removeClass('inactive').addClass('focus');
      $('.focus input, .focus textarea').focus();
      $('html,body').scrollTop($('.focus').offset().top - 100);
      $('#routine-preview').scrollTop($('.focus').offset().top);
    }
});

$('.question-item').click(function(e) {
      $('.focus input, .focus textarea').blur();
      $('.focus').removeClass('focus').addClass('inactive')
      $(this).removeClass('inactive').addClass('focus');
      $('.focus input, .focus textarea').focus();
      $('html,body').scrollTop($('.focus').offset().top - 100);
      $('#routine-preview').scrollTop($('.focus').offset().top);
      e.preventDefault();
});

$('.short-text input, .long-text textarea').keypress(function(e) {
  if (e.keyCode != 13 || e.which != 13) {
      $('.focus .btn-enter').delay(300).fadeIn(600);
  };

});

$('.short-text input, .long-text textarea').keyup(function() {
  if (!this.value) {
    $('.focus .btn-enter').fadeOut(600);
  };
});

$('.choice').click(function() {
  if ($(this).hasClass('answer')) {
    $(this).removeClass('answer');
    if ($(this).parents('.multiple').length) {
      choice_value = $('.focus input').val();
      choices = choice_value.split("//CHOICE//");
      choices.pop();
      var value = $(this).find('.label').text();
      var index = choices.indexOf(value);
      if (index >= 0) {
        choices.splice( index, 1 );
      }
      if (choices.length == 1) {
        value = choices[0] + '//CHOICE//';
      } else {
        value = choices.join('//CHOICE//');
        value = value + '//CHOICE//';
      };
      $('.focus input').val(value);
    console.log($('.focus input').val());
    } else {
    $('.focus input').val('');
    };
  } else {
    if ($(this).parents('.scale').length || $(this).parents('.yes-no').length) {
      $('.answer').removeClass('answer');
      $(this).addClass('answer');
      $('.focus input').val(function() {
        var value = $('.focus .answer').find('.label').text();
        return value.toLowerCase();
      });
    } else {

      // Multiple Choice Question: Selecting Choice

      $(this).addClass('answer');
      choice_value = $('.focus input').val();
      $('.focus input').val('');
      var value = $(this).find('.label').text();
      value = value + '//CHOICE//';
      $('.focus input').val(choice_value + value);
    };

  };
});

$('.numbers input').keypress(function(e) {
      if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 $('.focus .btn-enter').delay(300).fadeIn(600);
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
            $(this).closest('li').effect('shake');
        }
});
