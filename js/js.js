$(document).ready(function() {  //main nav functions

    $('.tohide').hide();
    $('.btnhide').click(function(){
        var target = "#" + $(this).data("target");
        $(".tohide").not(target).hide();
        $(target).show();
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });
});

$(document).ready(function() {
    $("#Intro").show();
    $("html, body").animate({ scrollTop: 0 }, "slow");
});
