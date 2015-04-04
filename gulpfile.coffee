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
  app       : [
                "source/app.coffee"
                "source/entities/*.coffee"
                "source/styles/*.coffee"
                "source/components/*.cjsx"
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
    .pipe concat "index.ios.cjsx"
    .pipe cjsx().on "error", gutil.log
    .pipe gulp.dest path.build
    .pipe uglify mangle: true

gulp.task "init", ["app"]

gulp.task "default", ->
  gulp.watch path.app, ["app"]
