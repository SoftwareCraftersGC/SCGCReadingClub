task :default => [:all_tests]

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:all_tests) do |task|
  task.pattern = "tests/*_spec.rb"
  task.verbose = false
end
