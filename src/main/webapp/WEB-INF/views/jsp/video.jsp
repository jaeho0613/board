<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://vjs.zencdn.net/7.11.4/video-js.css" rel="stylesheet"/>
    <title>Document</title>
</head>

<body>
<video id="my-player" class="video-js">
    <source src="//vjs.zencdn.net/v/oceans.mp4" type="video/mp4">
    <source src="//vjs.zencdn.net/v/oceans.webm" type="video/webm">
</video>

<script src="https://vjs.zencdn.net/7.11.4/video.min.js"></script>

<script>
    $(document).ready(function () {
        let options = {
            sources: [
                {src: "//vjs.zencdn.net/v/oceans.mp4", type: "video/mp4"}
            ],
            playbackRates: [.5, .75, 1, 1.25, 1.5],
            poster: "[이미지 주소 등록]",
            controls: true,
            preload: "auto",
            width: 540,
            height: 320,
            controlBar: {
                playToggle: false,
                pictureInPictureToggle: false,
                remainingTimeDisplay: true,
                progressControl: false,
                qualitySelector: true,
            }
        };

        var player = videojs('myplayer', options);
        player.src([
            {
                src: '/video/play/720',
                type: 'video/mp4',
                label: '720P',
            },
            {
                src: '/video/play/480',
                type: 'video/mp4',
                label: '480P',
                selected: true,
            },
            {
                src: '/video/play/360',
                type: 'video/mp4',
                label: '360P',
            },
        ]);
    })
</script>
</body>

</html>