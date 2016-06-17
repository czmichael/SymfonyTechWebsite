// grab our packages
var gulp   = require('gulp'),
    notify = require('gulp-notify'),
    livereload = require('gulp-livereload');


livereload({ start: true });


// define the default task and add the watch task to it
gulp.task('default', ['watch']);

//======== Global Variables ==========
var TOMCAT_LOCATION = '/usr/local/apache-tomcat-7.0.59/webapps/ROOT';
var DEV_LOCATION = 'src/main/webapp';

// ======== Gulp tasks ==========
gulp.task('copy-html', function() {
	return gulp.src(DEV_LOCATION + '/*.html')
		.pipe(gulp.dest(TOMCAT_LOCATION + '/'))
		.pipe(livereload())
		.pipe(notify('======== copy-html is done. =========='));
});

gulp.task('copy-css', function() {
	return gulp.src(DEV_LOCATION + '/*.css')
	.pipe(gulp.dest(TOMCAT_LOCATION + '/'))
	.pipe(livereload())
	.pipe(notify('======== copy-css is done. =========='));
});

gulp.task('copy-js', function() {
	return gulp.src(DEV_LOCATION + '/*.js')
	.pipe(gulp.dest(TOMCAT_LOCATION + '/'))
	.pipe(livereload())
	.pipe(notify('======== copy-js is done. =========='));
});
// ======== Gulp watch ==========
gulp.task('watch', function() {
	livereload.listen();
	gulp.watch(DEV_LOCATION + '/*.js', ['copy-js']);
	gulp.watch(DEV_LOCATION + '/*.html', ['copy-html']);
	gulp.watch(DEV_LOCATION + '/*.css', ['copy-css']);
});





