var video = {};
video.showVideoPopup = function(videoUrl) {
    console.log('Showing video popup for video ' + videoUrl + '...');
    $('#video-overlay').fadeIn('fast');
    $('#video-overlay').css('height', $('.wrapper').css('height'));
    $('body').scrollTop(0);
    jwplayer("video-container").setup({
        autostart: true,
        flashplayer: "/media/jwplayer/player.swf",
        file: videoUrl,
        height: "100%",
        width: "100%",
        controlbar: 'bottom'
    });
    $('#video-popup').fadeIn('fast');
    video.bindVideoPopup();
}

video.hideVideoPopup = function() {
    console.log('Hiding video popup...');
    $('#video-popup .popup-content').html('');
    $('#video-overlay').fadeOut('fast');
    $('#video-popup').fadeOut('fast');
    $('#video-popup div.popup-content').html('<div id="video-container"></div>');
}

video.bindVideoPopup = function() {
    console.log('Binding video popup...');
    $('#close-video-popup').unbind('click').click(function(e) {
        e.preventDefault();
        video.hideVideoPopup();
    });
}

video.bindVideoLinks = function() {
    $('a.video').unbind('click').click(function(e) {
        e.preventDefault();
        console.log(e.targetNode);
        var videoUrl = $(e.target).attr('data-video-url');
        console.log(videoUrl);
        video.showVideoPopup(videoUrl);
    });
}
//homepage slider
$(document).ready(function() {

    video.bindVideoLinks();

//landign page						   
    if ($('.landing').length > 0) {
        $('html').css('height', '100%')
    }


    var sl_h = $('.section-left').height() - 2;
    var b_h = $('.bordered').height()
    if (b_h < sl_h) {
        //$('.bordered').css('height', sl_h + 'px');
        $('.bordered').css('height', '578px');
    }

    if ($('.lslider').length) {
        var lslider = $('.lslider').bxSlider({
            mode: 'fade',
            pause: 3000,
            autoHover: true
        });
    }

//latest news slider
    if ($('.newsslider li').length > 2) {
        var newsslider = $('.newsslider').bxSlider({
            mode: 'horizontal',
            displaySlideQty: 3,
            moveSlideQty: 3,
            pause: 5000,
            autoHover: true,
            pager:true,
            controls:false,
            auto:true
        });
        $('.bxprev').click(function() {
            newsslider.goToPreviousSlide();
            return false;
        });

        $('.bxnext').click(function() {
            newsslider.goToNextSlide();
            return false;
        });

        var boxw = ($('.bx-pager').parent().width() - $('.bx-pager').width()) / 2;
        $('.bx-pager').css('margin-left', boxw + 'px');
    }

//image slider
    if ($('.imgslider li').length > 5) {
        var nritems = 5;
        if ($('.imgfiles').length)
            nritems = 2
        var imgslider = $('.imgslider').bxSlider({
            mode: 'horizontal',
            displaySlideQty: nritems,
            moveSlideQty: 1,
            pause: 3000,
            autoHover: true
        });


    }

    //homepage big slider
    if ($('.slider li').length > 0) {
        //initilaization
        var nr_slider_items = $('.slides li').length;
        var slider_item_details = '';
        var slider = $('.slider').bxSlider({
            mode: 'fade',
            pause: 5000,
            autoStart: true,                    // true, false - if false show will wait for 'start' control to activate
            autoHover: true,
            controls:false,
            auto:true,
            onNextSlide: function(currentSlide, totalSlides) {
                $('.slides li').removeClass('active');
                $('.slides li:eq(' + currentSlide + ')').addClass('active');
            },
            onPrevSlide: function(currentSlide, totalSlides) {
                $('.slides li').removeClass('active');
                $('.slides li:eq(' + currentSlide + ')').addClass('active');
            }

        });

        $('.slides li').mouseover(function() {
            $('.slides li').removeClass('active');
            $(this).addClass('active');
            var click_idx = $(this).index();
            slider.goToSlide(click_idx, false);
            //		slider.startShow();
            return false;
        });
        $('.prev').click(function() {
            slider.goToPreviousSlide();
            return false;
        });

        $('.next').click(function() {
            slider.goToNextSlide();
            return false;
        });
    }


//pagging box cebter aling
    if ($('.paging').length > 0) {
        var boxw = ($('.paging').parent().width() - $('.paging').find('ul').width()) / 2;
        $('.paging').find('ul').css('margin-left', boxw + 'px');
    }

//gallery lightbox
    //if ($('.gallery').length)
    $('a.lightbox').lightBox({
        imageLoading:            '/media/css/images/lightbox-ico-loading.gif',        // (string) Path and the name of the loading icon
        imageBtnPrev:            '/media/css/images/lightbox-btn-prev.gif',            // (string) Path and the name of the prev button image
        imageBtnNext:            '/media/css/images/lightbox-btn-next.gif',            // (string) Path and the name of the next button image
        imageBtnClose:            '/media/css/images/lightbox-btn-close.gif',        // (string) Path and the name of the close btn
        imageBlank:                '/media/css/images/lightbox-blank.gif'
    });


//form styling
    if ($('.styled').length)
        $('form').jqTransform({});

    /*$('.nav li').hover(
     function(){
     var sub = $(this).find('.dd:eq(0)');
     if( sub.length == 0 ) return false;
     sub.show();
     $(this).find('a:eq(0)').addClass('hovered');
     },
     function(){
     var sub = $(this).find('.dd:eq(0)');

     sub.hide();
     $(this).find('a:eq(0)').removeClass('hovered');
     }
     );*/

//___________________________________________
    //dropdown menu two level
    $('ul.sf-menu').superfish({
        delay:100,
        speed:200,
        animation:   {opacity:'show',height:'show'}
    });
    var $br = $("#browser");
    if ($br.length) {
        $br.treeview({});
    }
    // Written by Ershadul 
    $('#vote-button').click(function(e) {
        e.preventDefault();
        if ($('#poll-form :radio:checked').size() == 0) return false;
        $(this).parents('div.btn').hide();
        $('#ajax-loader').show();

        var data = $('#poll-form').serializeArray();
        console.log(data);
        $.ajax({
            type: 'POST',
            data: data,
            url: '/opinions/vote/',
            success: function(response) {
                $('#poll-form ul').replaceWith(response);
            },
            error: function() {

            }
        });
    });

    $('#tweet-btn').click(function(e) {
        e.preventDefault();
        var w = screen.width / 2 - 300;
        var url = document.URL;
        var title = $('title').text();
        //console.log(title);
        window.open('http://twitter.com/share?text=' + title + '&url=' + escape(url), "sharePopup", "width=600px,height=500px,resizable,top=150px,left=" + w + "px");
    });

    $('#share-btn').click(function(e) {
        e.preventDefault();
        var w = screen.width / 2 - 300;
        var url = document.URL;
        var title = $('title').text();
        //console.log(title);
        window.open('http://facebook.com/sharer/sharer.php?u=' + escape(url), "sharePopup", "width=600px,height=500px,resizable,top=150px,left=" + w + "px");
    });

    $('a.govt-member').click(function(e) {
        e.preventDefault();
        $('.pdf-popup').hide();
        var $popup = $(e.target).parent().find('.pdf-popup');
        $popup.css('top', $(e.target).position().top + $(e.target).outerHeight() + 2);

        $popup.show();

        $('.close').click(function(e) {
            e.preventDefault();
            $popup.hide();
        });
    });
    $('.open-pdf').click(function(e) {
        $('.pdf-popup').hide();
    });
    $('.download-pdf').click(function(e) {
        $('.pdf-popup').hide();
    });

    $('#sort-govt-duration').click(function(e){
        //console.log('I am here');
        e.preventDefault();
        var $target = $(e.target);
        var $table = $(e.target).closest('table');
        $table.find('tr').reverseOrder();
        $target.toggleClass('desc');
        if ($target.hasClass('desc')) {
            $target.find('span').html('&uarr;');
        } else {
            $target.find('span').html('&darr;');
        }
    });

});