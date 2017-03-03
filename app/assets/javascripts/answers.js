$('#username').keypress(function(event) {
    if (event.keyCode == 13 || event.which == 13) {
        $('#password').focus();
        event.preventDefault();
    }
});
