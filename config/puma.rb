prune_bundler

daemonize false

rackup DefaultRackup
environment ENV['RACK_ENV'] || 'development'

workers Integer(ENV['PUMA_WORKERS'] || 8)
threads_count_min = Integer(ENV['PUMA_THREADS_MIN'] || 8)
threads_count_max = Integer(ENV['PUMA_THREADS_MAX'] || 8)
threads threads_count_min, threads_count_max

# `PORT` variable is Heroku default
puma_port = Integer(ENV['PUMA_PORT'] || ENV['PORT'] || 5000)
port puma_port

bind 'tcp://0.0.0.0'
