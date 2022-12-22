document.addEventListener("turbolinks:load", function() {
  let checkbox = $('#remove_account');
  let hidden_check = $('#delete_user_check');
  let delete_button = $('#button_for_delete_account');

  checkbox.on('click', function (e) {
    if (checkbox.is(':checked')){
      hidden_check.value = true;
      delete_button.removeAttr('disabled');
      delete_button.removeClass('disabled');
    }
    else{
      hidden_check.value = false;
      delete_button.attr('disabled', '');
      delete_button.addClass('disabled');
    }
  });
});
