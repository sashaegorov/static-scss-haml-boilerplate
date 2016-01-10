# Require and configure LiveReload for static content server
require 'rack-livereload'
map '/' do
  # Rack::LiveReload middleware

  use Rack::LiveReload, no_swf: true, min_delay: 0, max_delay: 50
  # Rack::Static middleware
  # http://www.rubydoc.info/github/rack/rack/Rack/Static
  use Rack::Static, urls: [''], root: './tmp', index: 'index.html'
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
