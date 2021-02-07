require './config/environment'

class ApplicationController < Sinatra::Base
  # register Sinatra::Twitter::Bootstrap::Assets

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  patch "/advocates/:slug" do
    # binding.pry
    @advocate = Advocate.find_by_slug params[:slug]
    @advocate.update params[:advocate]
    if @advocate.valid? 
      flash[:message] = "Your Account Was Updated Successfully."
      redirect "/advocates/#{ @advocate.slug }"
    else
      binding.pry
      erb :"/advocates/edit"
    end
  end
  get "/" do
    # p self
    # binding.pry
    # @session = session

    erb :home
  end

  helpers do
    def current_user
      Advocate.find session[:user_id]
    end

end
