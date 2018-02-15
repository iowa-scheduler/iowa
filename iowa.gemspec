require './lib/iowa/version'

Gem::Specification.new do |s|
  s.name                     = 'iowa-scheduler'
  s.version                  = Iowa::VERSION
  s.required_ruby_version    = '>=2.3.5'
  s.date                     = Time.now.strftime('%Y-%m-%d')
  s.summary                  = 'Iowa Scheduler'
  s.description              = 'Distributed Offline Data Pipeline Scheduler'
  s.authors                  = ['Iowa']
  s.email                    = 'dsh0416@gmail.com'
  s.require_paths            = ['lib']
  s.bindir                   = 'bin'
  s.executables             << 'iowa'
  s.files                    = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|.resources)/}) } \
    - %w(README.md CONTRIBUTOR_COVENANT_CODE_OF_CONDUCT.md Gemfile Rakefile iowa.gemspec .gitignore .rspec .codeclimate.yml .rubocop.yml .travis.yml)
  s.homepage                 = 'https://github.com/iowa-scheduler/iowa'
  s.metadata                 = { 'issue_tracker' => 'https://github.com/iowa-scheduler/iowa/issues' }
  s.license                  = 'MIT'
  s.add_runtime_dependency     'hiredis', '~> 0.6.0'
  s.add_runtime_dependency     'midori.rb', '~> 0.5'
  s.add_runtime_dependency     'midori-contrib', '~> 0.1'
  s.add_runtime_dependency     'ohm', '~> 3.0'
  s.add_runtime_dependency     'google-protobuf', '~> 3.0'
  s.add_runtime_dependency     'mysql2', '~> 0.4'
end
