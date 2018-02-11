class Iowa::Boot
  def initialize(commands, sql, redis)
    @plugins = commands.map do |command|
      command[0].new(*command[1..-1])
    end
    Midori::Configure.before = proc do
      Ohm.redis = Redic.new(redis)
      DB = Sequel.connect(sql)
      Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
      PERSISTENCE_READY = true
    end
  end

  def run
    threads = @plugins.map do |t|
      Thread.new { t.run }
    end
    pool = ThreadsWait.new(*threads)
    pool.next_wait
    exit(-1)
  end
end
