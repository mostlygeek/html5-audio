# 
# Loads up preloadjs, and soundjs from the createjs.com projects
# via AMD loading and plays sounds and stuff
# 
#
require.config
    paths: 
        preloadjs: [
            'http://code.createjs.com/preloadjs-0.2.0.min'
            'libs/preloadjs-0.2.0.min'
        ]
        soundjs: [
            'http://code.createjs.com/soundjs-0.3.0.min'
            'libs/soundjs-0.3.0.min'
        ]

    shim: 
        preloadjs: 
            exports: 'createjs.PreloadJS'
        soundjs: 
            exports: 'createjs.SoundJS'

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
    preload.installPlugin SoundJS
    preload.loadManifest [
        {id: "begin", src: "/assets/Game-Spawn.mp3|/assets/Game-Spawn.ogg"}

        # note the `data: 6` this is passed to the SoundJS plugin. It basically means
        # how many instances can play concurrently. Important when using native html5 `<audio>`
        # tags for sound
        {id: "laser", src: "/assets/Game-Shot.mp3|/assets/Game-Shot.ogg", data: 6}

        {id: "bonk", src: "/assets/bonk.mp3|/assets/bonk.ogg", data: 10}
    ]
   
    # Updates the loading progress every 200ms
    $progress = $('#progress')
    updateProgressInterval = setInterval ->
        $progress.text "#{preload.progress*100|0}%"
    , 200

    preload.onComplete = ->
        clearInterval updateProgressInterval
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
            for i in [0...3]
                do (i) -> 
                    setTimeout -> 
                        SoundJS.play "laser"
                    , (i * 150)

        $('span.mouseover', $control).on "mouseover",  ->
            SoundJS.play "bonk", SoundJS.INTERRUPT_LATE

