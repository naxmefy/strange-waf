exports = module.exports = function(process, argv, done) {


    done(0);
};


exports.helpText = [
  'Sonea Precompile Command Line Tool!',
  '',
  'usage: sonea precompile [options] <target>',
  '',
  'Precompiles assets of a sonea app',
  '',
  'options:',
  '  -h, --help         print help',
  '  -l, --loglevel     set the loglevel',
  '  -P, --profile      print duration of cli action'
];