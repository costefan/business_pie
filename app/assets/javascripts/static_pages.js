
$(document).ready( function() {
    $('.carousel').carousel();
    $('.navbar-nav li').on('click','a',function(event) {
        if ($(this).attr('class') =='about' ||  $(this).attr('class') =='contacts') {
            event.preventDefault();
            var id = $(this).attr('href');
            var top = $(id).offset().top;
            $('body,html').animate({scrollTop: top},1500    );
        }
    });
});