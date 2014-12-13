// js/progress-bar.js

$(document).ready(function() {

  $(window).on('scroll', function() {
    $('.progress:above-the-top, .progress:below-the-fold').css('width', '0');
    $('.progress-bar:in-viewport').each(function() {
      var percent = parseFloat($(this).attr('percent'));
      $(this).find('.progress').animate({
        width: Math.round(percent*240) + 'px'
      }, 1000);
    });
  });
});
