class AdvocatesController < ApplicationController
  use Rack::Flash
  # GET: /advocates
  get "/advocates" do
    erb :"/advocates/index.html"
  end

  # GET: /advocates/new
  get "/advocates/new" do
    erb :"/advocates/new"
  end

  post "/advocates/registration" do
    if session[:id]
      session.clear
      # binding.pry
      erb :"/advocates/logout" 
    else
      erb :"/advocates/registration"
    end
  end
  
  # POST: /advocates
  post "/advocates" do
    
    @user = Advocate.create params[:advocate]
    # user.save
    if @user.valid?
      session[:id] = @user.id
      flash[:message] = "Congratulations #{@user.name}, Your Account Has Been Created SuccessFully."
      redirect to "/advocates/#{ @user.slug }"
    else
      erb :"/advocates/new"
    end
  end
  
  post '/login' do
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/home'
    end
    redirect '/sessions/login'
  end

  get "/advocates/registration" do
    if session[:id]
      session.clear
      # binding.pry
      erb :"/advocates/logout" 
    else
      erb :"/advocates/registration"
    end
  end
  # GET: /advocates/5
  get "/advocates/:slug" do
    @advocate = Advocate.find_by_slug params[:slug]
    # binding.pry
    erb :"/advocates/show.html"
  end

  # GET: /advocates/5/edit
  get "/advocates/:id/edit" do
    erb :"/advocates/edit.html"
  end

  # PATCH: /advocates/5
  patch "/advocates/:id" do
    redirect "/advocates/:id"
  end

  # DELETE: /advocates/5/delete
  delete "/advocates/:id/delete" do
    redirect "/advocates"
  end
end
