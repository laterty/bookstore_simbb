document.addEventListener("turbolinks:load", function() {
  $('#plus_books_price').click(function (e) {
    console.log('HEY')
    this.parentNode.querySelector('#books_price').stepUp()
    e.preventDefault();
  });

  $('#minus_books_price').click(function (e) {
    this.parentNode.querySelector('#books_price').stepDown()
    e.preventDefault();
  });
});
