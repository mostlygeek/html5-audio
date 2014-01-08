require [
    "jquery"
    "Howler"
], (
    $

    HowlerLib
) ->
    Howeler = HowlerLib.Howler
    Howl = HowlerLib.Howl

    $progress = $('#progress')

    bindUI = ->
        $progress.text "100%" # sometimes, if cached, it doesn't show up
        $control = $('#control')
        $('#loading').fadeOut 'slow', ->
            begin.play()
            $control.fadeIn 'slow'

        $('#laser', $control).on 'click', ->
            laser.play()

        # Simulate firing a gun multiple times
        # we use a setTimeout to space the shots a few ms apart
        $('#multi-shot', $control).on 'click', ->
            for i in [0..4]
                do (i) ->
                    setTimeout ->
                        laser.play()
                    , (i * 150)

        $('span.mouseover', $control).on "mouseover",  ->
            bonk.play()

    # ghetto loader...
    waitFor = 0
    onLoad = ->
        waitFor = waitFor + 1
        $progress.text "#{Math.floor(waitFor/3)*100}%"
        bindUI() if waitFor == 3


    begin = new Howl
        onload: onLoad
        urls: ["/assets/Game-Spawn.mp3", "/assets/Game-Spawn.ogg"]
    laser = new Howl
        onload: onLoad
        urls: ["/assets/Game-Shot.mp3", "/assets/Game-Shot.ogg"]
    bonk  = new Howl
        onload: onLoad
        urls: ["/assets/bonk.mp3", "/assets/bonk.ogg"]
