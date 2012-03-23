var video = {};
video.showVideoPopup = function(videoUrl) {
    console.log('Showing video popup for video ' + videoUrl + '...');
    $('#video-overlay').fadeIn('fast');
    //$('#video-overlay').css('height', $('.wrapper').css('height'));
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
        console.log(e.target);
        var videoUrl = $(e.target).attr('data-video-url');
        console.log(videoUrl);
        video.showVideoPopup(videoUrl);
    });
}
        
$(document).ready(function() {

    // IE does not have console.log function
    try {
            console.log('Initializing site.js ...');
    } catch (err) {
        console = {};
        console.log = function(text) {
            // leave it
        }
    }
    
    video.bindVideoLinks();

    //dropdown menu two level
    $('.clsmenu ul').superfish({
        delay:100,
        speed:200,
        animation:   {opacity:'show',height:'show'}
    });
    
    // Big Slider in Home page
    /*
    if ($('#slider').length){
		var slider = $('#slider').bxSlider({
			mode:'fade',
			controls:false,
			pager:true,
			auto:true,
			pause:5000

		});
		if ($('.bx-pager').length){
			var pw=$('.bx-pager a').length*51
			var boxw=($('.bx-pager').parent().width()-pw)/2; 
			$('.bx-pager').css({'padding-left':boxw+'px','padding-right':boxw+'px'});
		}
	}
	*/
    console.log('creating lof slider');
    $('#jslidernews2').lofJSidernews({ 
        interval: 5000,
		easing: 'easeInOutQuad',
		duration: 1200,
		auto: true,
		mainWidth: 640,
		mainHeight: 300,
		navigatorHeight: 100,
		navigatorWidth: 310,
		maxItemDisplay: 3
	});
	// Lightbox
	$('a.lightbox').lightBox({
        imageLoading:            '/media/css/images/lightbox-ico-loading.gif',        // (string) Path and the name of the loading icon
        imageBtnPrev:            '/media/css/images/lightbox-btn-prev.gif',            // (string) Path and the name of the prev button image
        imageBtnNext:            '/media/css/images/lightbox-btn-next.gif',            // (string) Path and the name of the next button image
        imageBtnClose:            '/media/css/images/lightbox-btn-close.gif',        // (string) Path and the name of the close btn
        imageBlank:                '/media/css/images/lightbox-blank.gif'
    });
    
});