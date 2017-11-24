//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require underscore
//= require gmaps/google
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {
  $(window).scroll(function() {
    var fromTop = $(document).scrollTop();
    if ( fromTop > $('.navbar').height() ) $('.navbar-wagon').addClass('minimized');
    else $('.navbar-wagon').removeClass('minimized');
  });

  const filters = function() {
  const min = $('.filters-price input:checked').data('min');
  const max = $('.filters-price input:checked').data('max');
  // const period = $('.filters-period input:selected').data('period');

 $('.office-card').each(function(i, element){
  const price = $(element).data('price');

   if(price >= min && price <= max)
      $(element).show();
    else
      $(element).hide();
  });
}

$('.filters-price, .filters-period').on('click', filters);



});


$(document).ready(function() {
  $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
    e.preventDefault();
    $(this).siblings('a.active').removeClass("active");
    $(this).addClass("active");
    var index = $(this).index();
    $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
    $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
  });
});

