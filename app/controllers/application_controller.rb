require './config/environment'

class ApplicationController < Sinatra::Base
  # register Sinatra::Twitter::Bootstrap::Assets

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    # p self
    # binding.pry
    @session = session
    erb :home
  end

end
