document.addEventListener('DOMContentLoaded', function() {
  const starRating = document.querySelector('.star-rating');
  const stars = starRating.querySelectorAll('.star');
  const ratingValue = starRating.querySelector('.rating-value');
  let currentRating = 0;

  stars.forEach(star => {
    star.addEventListener('mouseover', function() {
      const value = this.getAttribute('data-value');
      highlightStars(value);
    });

    star.addEventListener('mouseout', function() {
      highlightStars(currentRating);
    });

    star.addEventListener('click', function() {
      currentRating = this.getAttribute('data-value');
      ratingValue.textContent = currentRating;
      highlightStars(currentRating);
    });
  });

  function highlightStars(value) {
    stars.forEach(star => {
      star.classList.toggle('filled', star.getAttribute('data-value') <= value);
    });
  }
});