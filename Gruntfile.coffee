module.exports = (grunt) ->
  require("matchdep").filterDev("grunt-*").forEach grunt.loadNpmTasks

  grunt.initConfig
    jshint:
      all: [
        "freefocus.js",
        "jquery.freefocus.js",
        "test/*.js"
      ]
      options:
        jshintrc: '.jshintrc'

    karma:
      continuos:
        configFile: "karma.conf.coffee"
      check:
        configFile: "karma.conf.coffee"
        singleRun: true

    uglify:
      vanilla:
        files:
          "freefocus.min.js": [
            "freefocus.js"
          ]
      jquery:
        files:
          "jquery.freefocus.min.js": [
            "freefocus.js",
            "jquery.freefocus.js"
          ]

  grunt.registerTask "test", [
    "jshint",
    "karma:continuos"
  ]

  grunt.registerTask "default", [
    "jshint",
    "karma:check",
    "uglify"
  ]
