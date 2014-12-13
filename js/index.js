// js/index.js

$(document).ready(function() {

  var scrolling = false;
  var opacity = 0.0;

  $(window).scroll(function() {
    opacity = 1.0 - Math.max(0, ($(this).height() - $(this).scrollTop()) / $(this).height());
    $('nav').css('background-color', 'rgba(93, 173, 232, ' + opacity + ')');
    $('nav').css('box-shadow', '0px 1px 10px rgba(0, 0, 0, ' + opacity*0.26 + ')');
  });

  $('nav li a').click(function(e) {
    e.preventDefault();

    $('nav li a').removeClass('selected');
    $(this).addClass('selected');

    if(!scrolling) {
      scrolling = true;
      $('html, body').animate({
        scrollTop: $($(this).attr('href')).offset().top
      }, 'slow', function() { scrolling = false; });
    }
  });

  $('#portfolio .card').click(function() {
    window.open($(this).attr('href'));
  });

});
