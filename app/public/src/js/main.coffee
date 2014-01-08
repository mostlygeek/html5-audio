#
# Loads up preloadjs, and soundjs from the createjs.com projects
# via AMD loading and plays sounds and stuff
#
#
require [

    'jquery'
    'preloadjs'
    'soundjs'

], ($, PreloadJS, SoundJS) ->

    # preload all of our sound files
    # bind events
    # show the control panel
    # Blamo
    preload = new PreloadJS()
    preload.installPlugin(SoundJS)
    SoundJS.alternateExtensions = ["mp3"]
    preload.loadManifest [
        {id: "begin", src: "/assets/Game-Spawn.ogg"}

        # note the `data: 6` this is passed to the SoundJS plugin. It basically means
        # how many instances can play concurrently. Important when using native html5 `<audio>`
        # tags for sound
        {id: "laser", src: "/assets/Game-Shot.ogg", data: 6}

        {id: "bonk", src: "/assets/bonk.ogg", data: 10}
    ]

    # Updates the loading progress every 200ms
    $progress = $('#progress')
    preload.addEventListener 'progress', (e) ->
        $progress.text "#{e.progress*100|0}%"


    preload.addEventListener 'complete', ->
        $progress.text "100%" # sometimes, if cached, it doesn't show up

        $control = $('#control')
        $('#loading').fadeOut 'slow', ->
            SoundJS.play("begin")
            $control.fadeIn 'slow'

        $('#laser', $control).on 'click', ->
            SoundJS.play "laser", SoundJS.INTERRUPT_LATE

        # Simulate firing a gun multiple times
        # we use a setTimeout to space the shots a few ms apart
        $('#multi-shot', $control).on 'click', ->
            for i in [0..4]
                do (i) ->
                    setTimeout ->
                        SoundJS.play "laser"
                    , (i * 150)

        $('span.mouseover', $control).on "mouseover",  ->
            SoundJS.play "bonk", SoundJS.INTERRUPT_LATE

