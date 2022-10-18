document.addEventListener("turbolinks:load", function() {
  $('#plus_books_price').click(function (e) {
    this.parentNode.querySelector('#books_price').stepUp()
  });

  $('#minus_books_price').click(function (e) {
    console.log('hey');
    this.parentNode.querySelector('#books_price').stepDown()
  });
});
