require('./assets/semantic.min.css');
require('./assets/styles.css')
var Elm = require('./Main.elm');

var root = document.getElementById('root');

Elm.Main.embed(root, "");
