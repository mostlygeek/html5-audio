# we export a function that takes the app as an only parameter. Though we can
# take as many params (`db` for example) as we like.
#
module.exports = (app) ->

    # with app, we declare our routes and the handlers
    app.get '/', (req, res) ->
        res.render 'index'


    app.get '/sound-js-0.5.2', (req, res) ->
        res.render "demo",
            title: "PreloadJS v0.4.1 + SoundJS v.0.5.2"
            config:
                paths:
                    jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min"
                    preloadjs: [
                        'http://code.createjs.com/preloadjs-0.4.1.min'
                    ]
                    soundjs: [
                        'http://code.createjs.com/soundjs-0.5.2.min'
                    ]

                shim:
                    preloadjs:
                        exports: 'createjs.LoadQueue'
                    soundjs:
                        exports: 'createjs.Sound'

    app.get '/howler', (req, res) ->
        res.render "howler"
