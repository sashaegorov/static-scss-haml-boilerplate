# Require any additional compass plugins here.
add_import_path File.join(
  $LOAD_PATH.find{ |v| v =~ /rails-assets-foundation-sites/ },
  '..', 'app', 'assets', 'stylesheets')

# For more info see documentation:
# http://compass-style.org/help/documentation/configuration-reference/

environment = ENV['RACK_ENV'] || :development
sass_dir = './src/scss'  # Input directory
css_dir = './public/css' # Output directory

sourcemap = true
output_style = :nested
