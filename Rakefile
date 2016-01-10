require 'jasmine'
require 'fileutils'
load 'jasmine/tasks/jasmine.rake'

namespace :project do
  task :clean do
    %w(public/js public/css public/*.html).each do |f|
      FileUtils.rm_r Dir.glob(f), secure: true
    end
  end
end

desc 'Clean up `public`'
task :clean => %w(project:clean)
