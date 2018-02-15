module Iowa::Route
  class Root < Midori::API
    mount '/manage', Manage
    mount '/worker', Worker
  end
end
