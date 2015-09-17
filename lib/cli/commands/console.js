var Sonea = global.Sonea;

exports = module.exports = function(process, argv, done) {

    var sonea = new Sonea();
    console.log(sonea);
    
    done(0);
};

exports.helpText = [
  'Sonea Console Command Line Tool!',
  '',
  'usage: sonea console [options]',
  '',
  'Open an interactive node.js shell within sonea app',
  '',
  'options:',
  '  -h, --help         print help',
  '  -l, --loglevel     set the loglevel',
  '  -P, --profile      print duration of cli action'
];