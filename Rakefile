task :default => [:spec]

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |task|
  task.pattern = "tests/*_spec.rb"
  task.verbose = true
end
