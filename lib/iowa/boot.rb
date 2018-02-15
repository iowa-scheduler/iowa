commands = [
  [Iowa::Plugin::Server, '127.0.0.1', 1984],
]

plugins = commands.map do |command|
  command[0].new(*command[1..-1])
end

Midori::Configure.before = proc do
  Ohm.redis = Redic.new(REDIS_URL)
  DB = Sequel.connect(MYSQL_URL)
  Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
  PERSISTENCE_READY = true
end

threads = plugins.map do |t|
  Thread.new { t.run }
end

pool = ThreadsWait.new(*threads)
pool.next_wait
exit(-1)
