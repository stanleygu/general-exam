'use strict';

var gulp = require('gulp');
var spawn = require('child_process').spawn;
var gutil = require('gulp-util');

gulp.task('default', function() {
  var child = spawn('make', undefined, {
    cwd: process.cwd()
  });
  var stdout = '';
  var stderr = '';

  child.stdout.setEncoding('utf8');

  child.stdout.on('data', function(data) {
    stdout += data;
    gutil.log(data);
  });

  child.stderr.setEncoding('utf8');
  child.stderr.on('data', function(data) {
    stderr += data;
    gutil.log(gutil.colors.red(data));
    gutil.beep();
  });

  child.on('close', function(code) {
    if (code > 0) {
      gutil.log('Done with exit code', gutil.colors.red(code));
      gutil.beep();
    } else {
      gutil.log('Done with exit code', code);
    }
  });

});

gulp.task('watch', function() {
  gulp.watch([
    '*.tex',
    '*.bib'
  ], ['default']);
});
