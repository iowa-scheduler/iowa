module Iowa::Route
  class Manage < Midori::API
    get '/blueprint' do
      # Get blueprint list
    end

    post '/blueprint' do
      # Create blueprint
    end

    put '/blueprint/:id' do
      # Edit blueprint
    end

    delete '/blueprint/:id' do
      # Delete blueprint
    end

    get '/pipeline' do
      # Get pipeline list
    end

    post '/pipeline' do
      # Create pipeline
    end

    delete '/pipeline/:id' do
      # Cancel pipeline
    end

    get '/stat' do
      # Return stats
    end
  end
end
