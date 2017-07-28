

$(document).ready(function() {  //main nav functions
    $('.nav-toggle').click(function(){
        event.preventDefault();
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


    $('.pop-up-toggle').click(function(){
        $(".pop-up-content--on").removeClass("pop-up-content--on");        
        var target = $(this).data("pop-target");
        var popUpContent = $("[data-pop-content='" + target + "']");  
        $(popUpContent).addClass('pop-up-content--on');
        $("html, body").animate({ scrollTop: 0 }, "slow");
    });

    $('.tab-item').click(function(){
        $(".tab-item--active").removeClass("tab-item--active"); 
        $(this).addClass('tab-item--active');     
    });


    $('.mob-nav-toggle').click(function(){   
        $('.body').toggleClass('body--open');     
    });

    $('.mob-nav-close').click(function(){   
        console.log("clicked");     
        $('.body--open').removeClass('body--open');     
    });

    var i, len, popUpToggle, popUpToggles;

    popUpToggles = document.querySelectorAll('.pop-up-toggle');

    for (i = 0, len = popUpToggles.length; i < len; i++) {
      popUpToggle = popUpToggles[i];
      popUpToggle.addEventListener('click', function() {
        $("html, body").animate({ scrollTop: 0 }, "slow");
        document.querySelector('.body').classList.toggle('body--pop-up-active');
        return removeVideo();
      });
    }

    document.querySelector('.pop-up__content').addEventListener('click', function(ev) {
      return ev.stopPropagation();
    });

});

