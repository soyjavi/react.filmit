"use strict"

# -- DEPENDENCIES --------------------------------------------------------------
gulp    = require "gulp"
cjsx    = require "gulp-cjsx"
concat  = require "gulp-concat"
gutil   = require "gulp-util"
uglify  = require "gulp-uglify"
pkg     = require "./package.json"

# -- FILES ---------------------------------------------------------------------
path =
  build     :   "./"
  dist      :   "./dist"
  app       :   "./source/index.ios.cjsx"
  modules   : [
                "./source/*/*"
              ]

banner = [
  "/**"
  " * <%= pkg.name %> - <%= pkg.description %>"
  " * @version v<%= pkg.version %>"
  " * @link    <%= pkg.homepage %>"
  " * @author  <%= pkg.author.name %> (<%= pkg.author.site %>)"
  " * @license <%= pkg.license %>"
  " */"
  ""
].join("\n")

# -- TASKS ---------------------------------------------------------------------
gulp.task "app", ->
  gulp.src path.app
    # .pipe concat "index.ios.cjsx"
    .pipe cjsx().on "error", gutil.log
    # .pipe uglify mangle: true
    .pipe gulp.dest path.build

gulp.task "modules", ->
  gulp.src path.modules, base: "./source"
    .pipe cjsx().on "error", gutil.log
    .pipe gulp.dest path.dist

gulp.task "init", ["app", "modules"]

gulp.task "default", ->
  gulp.watch path.app, ["app"]
  gulp.watch path.modules, ["modules"]
