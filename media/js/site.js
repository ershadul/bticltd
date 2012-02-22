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

$(document).ready(function() {

    video.bindVideoLinks();

    //dropdown menu two level
    $('.clsmenu ul').superfish({
        delay:100,
        speed:200,
        animation:   {opacity:'show',height:'show'}
    });

});