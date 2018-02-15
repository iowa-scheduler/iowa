require './lib/iowa/version'

task :compile do
  puts `protoc -I ./proto --ruby_out ./lib/iowa/protos proto/*.proto`
end

task :build do
  puts `gem build iowa.gemspec`
end

task :install do
  puts `gem build iowa.gemspec`
  puts `gem install ./iowa-scheduler-#{Iowa::VERSION}.gem`
end
