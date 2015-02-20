module.exports = (grunt) ->
	pkg = grunt.file.readJSON('package.json')

	grunt.initConfig
		coffee:
			main:
				files:
					'libs/array-pagination.js': 'src/array-pagination.coffee'

		watch:
			main:
				files: ['src/**']
				tasks: ['coffee']

	# Registering tasks
	tasks =
		default: ['coffee', 'watch']
	
	grunt.registerTask taskName, taskArray for taskName, taskArray of tasks

	# Load NPM tasks
	grunt.loadNpmTasks name for name of pkg.devDependencies when name[0..5] is 'grunt-'