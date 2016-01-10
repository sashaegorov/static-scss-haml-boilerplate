prune_bundler

unless ENV['PUMA_USE_PRELOAD'].nil?
  preload_app!
  # This will fail without preloaded application
  on_worker_boot do
    ActiveRecord::Base.establish_connection
  end
end

daemonize false

rackup DefaultRackup
environment ENV['RACK_ENV'] || 'development'

workers Integer(ENV['PUMA_WORKERS'] || 2)
threads_count_min = Integer(ENV['PUMA_THREADS_MIN'] || 2)
threads_count_max = Integer(ENV['PUMA_THREADS_MAX'] || 4)
threads threads_count_min, threads_count_max

# `PORT` variable is Heroku default
puma_port = Integer(ENV['PUMA_PORT'] || ENV['PORT'] || 5000)
port puma_port

bind 'tcp://0.0.0.0'
