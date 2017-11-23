$(document).ready(function() {
  $('.attachinary-input').attachinary();
});


$(document).ready(function() {
  $(window).scroll(function() {
    var fromTop = $(document).scrollTop();
    if ( fromTop > $('.navbar').height() ) $('.navbar-wagon').addClass('minimized');
    else $('.navbar-wagon').removeClass('minimized');
  });
});

// // init Isotope
// var $grid = $('.grid').isotope({
//   itemSelector: '.office-card',
//   layoutMode: 'fitRows'
// });
// // filter functions
// var filterFns = {
//   // show if number is greater than 50
//   numberGreaterThan50: function() {
//     var price = $(this).find('.price-tag').text();
//     return parseInt( price, 10 ) > 50;
//   },
//   // show if name ends with -ium
//   ium: function() {
//     var period = $(this).find('.period-tag').text();
//     return period.match( /hour$/ );
//   }
// };

// // bind filter on radio button click
// $('.filters-price').on( 'click', 'input', function() {
//   // get filter value from input value
//   var filterValue = this.value;
//   // use filterFn if matches value
//   filterValue = filterFns[ filterValue ] || filterValue;
//   $grid.isotope({ filter: filterValue });
// });
