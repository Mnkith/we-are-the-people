class ApplicationController < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
  end

  get "/" do
    erb :'/causes/index'
  end

  helpers do
    def current_user
      if session[:user_id] && Advocate.find_by(id: session[:user_id]) #find will rais an error if no id was found while find_by will return nil
        Advocate.find session[:user_id] 
      else
        session[:user_id] = nil
      end
    end

    def reset 
      session.clear
      current_user = nil
    end

    def time_of_day
      hour = Time.now.strftime("%H%M").to_i
      case hour
        when 0..1159
          'Morning'
        when 1200..1759
          'Afternoon'
        when 1800..2359
          'Evening'
      end
    end
  end
end
