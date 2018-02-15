require 'rspec/core/rake_task'
require './lib/iowa/version'

task :default => %i(spec)

RSpec::Core::RakeTask.new(:spec)

task :compile do
  puts `protoc -I ./proto --ruby_out ./lib/iowa/protos proto/*.proto`
end

task :build => %i(compile) do
  puts `gem build iowa.gemspec`
end

task :install => %i(build) do
  puts `gem install ./iowa-scheduler-#{Iowa::VERSION}.gem`
end
