function fillReviewStars(){
  let default_rating = document.getElementById('review_rating');
  let stars_icons = document.querySelectorAll('#rating i');
  const EMPTY_STAR_CLASS = 'rate-empty';
  const FILLED_STAR_CLASS = 'rate-star';

  for (let star of stars_icons) {
    star.addEventListener('click', ()=>{
      default_rating.value = star.getAttribute('data-value')
      for (let i = 0; i < default_rating.value; i++) {
        stars_icons[i].classList.remove(EMPTY_STAR_CLASS)
        stars_icons[i].classList.add(FILLED_STAR_CLASS)
      }
      for (let i = default_rating.value; i < stars_icons.length; i++) {
        stars_icons[i].classList.add(EMPTY_STAR_CLASS)
        stars_icons[i].classList.remove(FILLED_STAR_CLASS)
      }
    })
  }
}


document.addEventListener("turbolinks:load", function() {
  fillReviewStars();
});
