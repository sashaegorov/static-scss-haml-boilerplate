# CoffeeScript compilation settings
# Settings for `src` scripts:
coffee_options_src = {
  # Check more options here:
  # https://github.com/guard/guard-coffeescript
  input: 'src', output: 'public',
  patterns: [%r{^src/(.+\.(?:coffee|coffee\.md|litcoffee))$}],
  all_on_start: true,   # run all on start
  shallow: false,       # create nested output directories
  source_map: true      # create source maps
}
# Settings for specs:
coffee_options_spec = {
  input: 'spec/javascripts/', output: 'spec/javascripts/',
  patterns: [%r{^spec/javascripts/(.+\.(?:coffee|coffee\.md|litcoffee))$}],
  all_on_start: true,
  bare: true # Don't wrap specs' in function
}

group :all_the_stuff, halt_on_fail: true do
  # Compile `src` scripts
  guard 'coffeescript', coffee_options_src do
    coffee_options_src[:patterns].each { |pattern| watch(pattern) }
  end

  # Compile specs' CoffeeScript files
  guard 'coffeescript', coffee_options_spec do
    coffee_options_spec[:patterns].each { |pattern| watch(pattern) }
  end

  # Strip testing API i.e. JavaScript code between lines:
  # /*__TEST_ONLY_SECTION_STARTS__ */ and /*__TEST_ONLY_SECTION_ENDS__ */
  # and write it to file without `.dev` suffix
  # guard :shell do
  #   watch(%r{^public/.*\.dev\.js}) do |m|
  #     out = m[0].sub '.dev.js', '.js'
  #     `sed '/__TEST_ONLY_SECTION_STARTS__/,/__TEST_ONLY_SECTION_ENDS__/d' #{m[0]} > #{out}`
  #   end
  # end

  # Uglify main JavaScript file
  guard 'uglify',
        input: './public/js/main.js',
        output: './public/js/main.min.js'

  # Compile Haml
  guard :haml, notifications: true, run_at_start: true,
    input: 'src', output: 'public' do
    watch(/^.+(\.haml)$/)
  end

  # Compile SCSS
  guard :compass,
    configuration_file: './config/compass.rb',
    compile_on_start: true do
    watch(/.*\.scss$/)
  end

  # Update browser during development
  if ENV['RACK_ENV'] != 'production'
    guard 'livereload' do
      watch(%r{^spec/javascripts/(.*)\.js})
      watch(%r{^spec/javascripts/(.*)\.html})
      watch(%r{^public/(.*)\.js})
      watch(%r{^public/(.*)\.css})
      watch(%r{^public/(.*)\.html})
    end
  end
end
