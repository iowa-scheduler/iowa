module Iowa::Plugin
  class Server
    def initialize(bind, port)
      Midori::Configure.bind = bind
      Midori::Configure.port = port
      @runner = Midori::Runner.new(Iowa::Route::Root)
    end

    def run
      @runner.start
    end
  end
end
