class BoilerPlate
  def initialize
    @app = Rack::Builder.new do
      production = ENV['RACK_ENV'] == 'production'
      # TODO: Skip some stuff if we are in production. Refactor this.
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
    end
  end

  def call(env)
    @app.call(env)
  end
end

# TODO: add logic around RACK_SECURE=yes variable
if ENV['RACK_ENV'] == 'production'
  secure = Rack::Auth::Digest::MD5.new(run BoilerPlate.new) do |user|
    {ENV['RACK_USER'] => ENV['RACK_PASSWORD']}[user]
  end
  secure.realm = 'Please enter password'
  secure.opaque = ENV['RACK_OPAQUE']
  run secure
else
  run BoilerPlate.new
end
