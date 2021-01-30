require './config/environment'

class ApplicationController < Sinatra::Base
  # register Sinatra::Twitter::Bootstrap::Assets

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
