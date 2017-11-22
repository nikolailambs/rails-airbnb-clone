$(document).ready(function() {
  $('.attachinary-input').attachinary();
});


$(function() {
  $('.card-link').hover(function() {
    $('.card-description').css('color', '#AA0003');
  }, function() {
    // on mouseout, reset the background colour
    $('.card-description').css('color', '');
  });
});
