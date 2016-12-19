var tabsFn = (function() {
  
  function init() {
    setHeight();
  }
  
  function setHeight() {
    var $tabPane = $('.vertical'),
        tabsHeight = $('.nav-tabs').height();
    
    $tabPane.css({
      height: tabsHeight
    });
  }
    
  $(init);
})();

$(document).ready(function() {

    $('.tohide').hide();
    $('.btnhide').click(function(){
        var target = "#" + $(this).data("target");
        $(".tohide").not(target).hide();
        $(target).show();
    });

});