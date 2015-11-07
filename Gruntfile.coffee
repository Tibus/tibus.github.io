"use strict"

module.exports = ( grunt ) ->

  require( "matchdep" ).filterDev( "grunt-*" ).forEach grunt.loadNpmTasks

  grunt.initConfig
    # html
    jade:
      options:
        compress: no
      page:
        files: ["index.html": "src/jade/index.jade", "cv.html": "src/jade/cv.jade"]
    # CSS
    sass:
      options:
        compress: no
      dist:
        files:["assets/styles.css": "src/sass/styles.scss", "assets/styles_cv.css": "src/sass/styles_cv.scss"]
    csso:
      options:
        report: "gzip"
      styles:
        files: ["assets/styles.min.css": "assets/styles.css", "assets/styles_cv.min.css": "assets/styles_cv.css"]
    # Watch
    watch:
      jade:
        files:["src/jade/index.jade","src/jade/cv.jade"]
        tasks: [ "html" ]
        options:
          livereload: yes
      styles:
        files:["src/sass/styles.scss", "src/sass/styles_cv.scss"]
        tasks: [ "css" ]
        options:
          livereload: yes

  grunt.registerTask "html", [ "jade" ]

  grunt.registerTask "css", [
    "sass"
    "csso"
  ]

  grunt.registerTask "default", [
    "html"
    "css"
  ]

  grunt.registerTask "work", [
    "jade"
    "css"
    "watch"
  ]
