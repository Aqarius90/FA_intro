

$(document).ready(function() {  //main nav functions
    $('.nav-toggle').click(function(){
        $(".nav-toggle--on").removeClass("nav-toggle--on");
        $(this).addClass('nav-toggle--on');
        var target = $(this).data("target");
        var page = $("[data-page='" + target + "']");
        $('.page--on').removeClass('page--on');
        $(page).addClass('page--on');
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });

    $('.section-toggle').click(function(){
        $(".section-toggle--on").removeClass("section-toggle--on");        
        var target = $(this).data("target");
        var toggleTarget = $("[data-target='" + target + "']");
        $(toggleTarget).addClass('section-toggle--on');
        var section = $("[data-section='" + target + "']");        
        $('.section--on').removeClass('section--on');
        $(section).addClass('section--on');
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });

    $('.tab-item').click(function(){
        $(".tab-item--active").removeClass("tab-item--active"); 
        $(this).addClass('tab-item--active');     
    });
});
