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
                        
            editor:
                files:
                    '<%= pkg.www %>/scripts/local-editor.js': [
                        'scripts/local-editor.coffee'
                    ]

            spec:
                files:
                    'scripts/spec.js': [
                        'scripts/site/spec/site.coffee'
                        ]

        jasmine:
            site:
                src: ['<%= pkg.www %>/scripts/site.js']
                options:
                    vendor: ['node_modules/jasmine-ajax/lib/mock-ajax.js']
                    specs: 'scripts/spec.js'

        sass:
            options:
                sourcemap: 'none',
                style: 'compressed'


            site:
                files:
                    '<%= pkg.www %>/styles/site.css': 'styles/site/site.scss'

        nunjucks_render:
            templates:
                files:
                    # Consumer emails
                    '../index.html' : 'content/index.html'
                    '../blank.html' : 'content/blank.html'

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
            frontend:
                files: ['styles/site/**/*.scss', '**/scripts/**/*.coffee','content/**/**.html', 'base.html'],
                tasks: ['styles', 'scripts', 'templates']
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
    grunt.loadNpmTasks('grunt-contrib-jasmine')
    grunt.loadNpmTasks('grunt-contrib-sass')
    grunt.loadNpmTasks('grunt-contrib-uglify')
    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-nunjucks-render')

    # Build all scripts for the site
    grunt.registerTask('scripts', [
        'coffee:editor',
        'coffee:site',
        'coffee:spec',
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

    # Build everything
    grunt.registerTask('all', [
        'coffee:editor',
        'coffee:site',
        'coffee:spec',
        'nunjucks_render:templates',
        'uglify:site',
        'sass:site'
        ])

    # Build all scripts for the site and test they work
    grunt.registerTask('test', [
        'coffee:site',
        'coffee:spec',
        'jasmine:site'
        ])

    # Watchers
    grunt.registerTask('watch-frontend', ['watch:frontend'])
    grunt.registerTask('watch-scripts', ['watch:scripts'])
    grunt.registerTask('watch-styles', ['watch:styles'])