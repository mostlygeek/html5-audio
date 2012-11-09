createjs + require.js
======================

This is a demo showing usage of using [require.js](http://requirejs.org/) to load [PreloadJS](http://www.createjs.com/#!/PreloadJS) and [SoundJS](http://www.createjs.com/#!/SoundJS) from 
the [CreateJS](http://www.createjs.com) project.

This small demo shows how to create a require.js *shim* for the libraries and then include them via the standard
require.js `define` and `require` apis. 

Why? 
----

Sound in HTML5 games is generally pretty crappy. SoundJS is designed to fill in some of the gaps and difference between browsers to make development easier. This demo is an educational tool to test: 

* preloading of assets
* playing sounds triggered by events (any play latency)
* playing multiple sounds at once. The `<audio>` tag can not do this natively. 

Demo
----

[http://createjs-amd.herokuapp.com/](http://createjs-amd.herokuapp.com/)
