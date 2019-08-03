$(document).on('turbolinks:load', function(){
  $('.bxslider-big').bxSlider({
    slideWidth: 600
  });
  $('.bxslider-mini').bxSlider({
    slideWidth: 250,
    touchEnabled: false
  });
});