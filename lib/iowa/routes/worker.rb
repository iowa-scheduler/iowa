module Iowa::Route
  class Worker < Midori::API
    ws '/register' do
      # Register worker
    end

    post '/done' do
      # Task callback from worker
    end
  end
end
