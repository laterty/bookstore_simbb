document.addEventListener("turbolinks:load", function() {
  $('#book_read_more').click(function (e) {
    $('#truncate_description').remove();
    $('#full_description').removeClass('hidden');
    e.preventDefault();
  });
});
