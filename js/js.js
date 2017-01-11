$(document).ready(function() {

    $('.tohide').hide();
    $('.btnhide').click(function(){
        var target = "#" + $(this).data("target");
        $(".tohide").not(target).hide();
        $(target).show();
    });

});