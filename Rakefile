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

namespace :db do
  require 'sequel'
  Sequel.extension :migration
  DB = Sequel.connect('mysql2://root@127.0.0.1:3306/iowa')

  desc 'Prints current schema version'
  task :version do
    version = if DB.tables.include?(:schema_info)
                DB[:schema_info].first[:version]
              end || 0

    puts "Schema Version: #{version}"
  end

  desc 'Perform migration up to latest migration available'
  task :migrate do
    Sequel::Migrator.run(DB, "lib/iowa/migrations")
    Rake::Task['db:version'].execute
  end

  desc 'Perform rollback to specified target or full rollback as default'
  task :rollback, :target do |_t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, "lib/iowa/migrations", :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc 'Perform migration reset (full rollback and migration)'
  task :reset do
    Sequel::Migrator.run(DB, "lib/iowa/migrations", :target => 0)
    Sequel::Migrator.run(DB, "lib/iowa/migrations")
    Rake::Task['db:version'].execute
  end
end
