# Skip some stuff if we are in production
production = ENV['RACK_ENV'] == 'production'
require 'rack-livereload' unless production

map '/' do
  use Rack::LiveReload, no_swf: true,
    min_delay: 0, max_delay: 50 unless production
  # http://www.rubydoc.info/github/rack/rack/Rack/Static
  use Rack::Static, urls: [''], root: './public', index: 'index.html'
  run lambda { |*| }
end

# Serve shared assets
map '/lib' do
  use Rack::Static, urls: [''], root: './lib'
  run lambda { |*| }
end
# Serve assets' sources for soureses' maps
map '/src' do
  use Rack::Static, urls: [''], root: './src'
  run lambda { |*| }
end
