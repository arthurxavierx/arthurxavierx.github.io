// js/index.js

$(document).ready(function() {
  // cards
  $('table[href]').click(function() {
    window.open($(this).attr('href'));
  });
});
