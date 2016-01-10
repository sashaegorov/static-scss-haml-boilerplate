require 'jasmine'
require 'fileutils'
load 'jasmine/tasks/jasmine.rake'

namespace :project do
  task :clean do
    %w(tmp/js tmp/css tmp/*.html).each do |f|
      FileUtils.rm_r Dir.glob(f), secure: true
    end
  end
end

desc 'Clean up `tmp`'
task :clean => %w(project:clean)
