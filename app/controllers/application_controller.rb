require './config/environment'

class ApplicationController < Sinatra::Base
  # register Sinatra::Twitter::Bootstrap::Assets

  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
  end
  patch "/advocates/:slug" do
    # binding.pry
    @advocate = Advocate.find_by_slug params[:slug]
    @advocate.update params[:advocate]
    if @advocate.valid? 
      flash[:message] = "Your Account Was Updated Successfully."
      redirect "/advocates/#{ @advocate.slug }"
    else
      # binding.pry
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
      if session[:user_id] && Advocate.find_by(id: session[:user_id]) #find will rais an error if no id was found while find_by will return nil
        Advocate.find session[:user_id] 
      else
        session[:user_id] = nil
      end
    end

    def sessions_errors obj 
      session[:errors] = obj.errors
    end

  end

end
