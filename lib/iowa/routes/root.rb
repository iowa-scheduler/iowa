module Iowa::Route
  class Root < Midori::API
    mount '/manage', Manage
    mount '/monitor', Monitor
    mount '/worker', Worker
  end
end
