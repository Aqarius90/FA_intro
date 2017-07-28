module.exports = (grunt) ->

    # Project configuration
    grunt.initConfig({

        pkg: grunt.file.readJSON('package.json')

        coffee:
            options:
                join: true

            site:
                files:
                    'tmp/site.js': [
                        'scripts/site.coffee'
                        'scripts/nav.coffee'
                        ]
                        
        sass:
            options:
                sourcemap: 'none',
                style: 'compressed'


            site:
                files:
                    '<%= pkg.www %>/styles/site.css': 'styles/site/site.scss'

        uglify:
            options:
                mangle: true

            site:
                files: {
                    '<%= pkg.www %>/scripts/site.js': [
                        'scripts/vendor/awesomplete.js'
                        'scripts/vendor/datepickr.js'
                        'tmp/site.js'
                        ]
                    }
        clean:
            tmp: 
                'tmp/site.js'

            
        watch:
            scripts:
                files: ['**/scripts/**/*.coffee',],
                tasks: ['scripts']

            styles:
                files: ['styles/site/**/*.scss',],
                tasks: ['styles']

    })

    # Plug-ins
    grunt.loadNpmTasks('grunt-contrib-clean')
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-sass')
    grunt.loadNpmTasks('grunt-contrib-uglify')
    grunt.loadNpmTasks('grunt-contrib-watch')

    # Build all scripts for the site
    grunt.registerTask('scripts', [
        'coffee:site',
        'uglify:site'
        ])

    # Build all styles for the site
    grunt.registerTask('styles', [
        'sass:site'
        ])

    # Build everything
    grunt.registerTask('templates', [
        'nunjucks_render:templates',
        ])
    # Watchers
    grunt.registerTask('watch-frontend', ['watch:frontend'])
    grunt.registerTask('watch-scripts', ['watch:scripts'])
    grunt.registerTask('watch-styles', ['watch:styles'])