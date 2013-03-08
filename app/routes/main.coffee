# we export a function that takes the app as an only parameter. Though we can
# take as many params (`db` for example) as we like.
#
module.exports = (app) ->
    
    # with app, we declare our routes and the handlers
    app.get '/', (req, res) ->
        res.render 'index'

    app.get '/sound-js-0.3.0', (req, res) ->
        res.render "demo",
            title: "PreloadJS v0.2.0 + SoundJS v0.3.0"
            config: 
                paths: 
                    jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min"
                    preloadjs: [
                        'http://code.createjs.com/preloadjs-0.2.0.min'
                    ] 
                    soundjs: [
                        'http://code.createjs.com/soundjs-0.3.0.min'
                    ]

                shim: 
                    preloadjs: 
                        exports: 'createjs.PreloadJS'
                    soundjs: 
                        exports: 'createjs.SoundJS'

    app.get '/sound-js-0.4.0', (req, res) ->
        res.render "demo",
            title: "PreloadJS v0.3.0 + SoundJS v0.4.0"
            config: 
                paths: 
                    jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min"
                    preloadjs: [
                        'http://code.createjs.com/preloadjs-0.3.0.min'
                    ] 
                    soundjs: [
                        'http://code.createjs.com/soundjs-0.4.0.min'
                    ]

                shim: 
                    preloadjs: 
                        exports: 'createjs.LoadQueue'
                    soundjs: 
                        exports: 'createjs.Sound'

    app.get '/sound-js-NEXT', (req, res) ->
        res.render "demo",
            title: "PreloadJS v0.3.0 + SoundJS v.NEXT"
            config: 
                paths: 
                    jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min"
                    preloadjs: [
                        'http://code.createjs.com/preloadjs-0.3.0.min'
                    ] 
                    soundjs: [
                        'https://raw.github.com/CreateJS/SoundJS/master/lib/soundjs-NEXT.min'
                    ]

                shim: 
                    preloadjs: 
                        exports: 'createjs.LoadQueue'
                    soundjs: 
                        exports: 'createjs.Sound'

    app.get '/howler', (req, res) ->
        res.render "howler"
