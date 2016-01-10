ruby '2.2.4'
source 'https://rubygems.org'

# Custom Rails assets from Bower packages
source 'https://rails-assets.org' do
  gem 'rails-assets-foundation-sites', '6.1.1'
end

group :production do
  gem 'foreman'
  gem 'rack-livereload'
  gem 'puma'
  gem 'compass'
  gem 'guard-compass'
  gem 'guard-uglify'
  gem 'guard-coffeescript'
  gem 'guard-livereload'
  gem 'guard-haml'
  gem 'guard-shell'
end

group :development, :test do
  gem 'haml_lint' # optional, however highly recommended
  gem 'jasmine', '~> 2.4'
end
