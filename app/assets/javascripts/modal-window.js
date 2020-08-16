$(function() {
  $('#open').on('click', function() {
    $('#overlay, #modal-window').fadeIn();
  });
  
  $('#close').on('click', function() {
    $('#overlay, #modal-window').fadeOut();
  });
  
  locateCenter();
  $(window).resize(locateCenter);

  function locateCenter() {
    let w = $(window).width();
    let h = $(window).height();
    
    let cw = $('#modal-window').outerWidth();
    let ch = $('#modal-window').outerHeight();
   
    $('#modal-window').css({
      'left': ((w - cw) / 2) + 'px',
      'top': ((h - ch) / 2) + 'px'
    });
  }
});
