class AdvocatesController < ApplicationController
  use Rack::Flash
  get "/advocates" do
    @advocate = Advocate.find session[:user_id]
    erb :"/advocates/index"
  end

  get "/advocates/new" do
    erb :"/advocates/new"
  end

  post "/advocates/registration" do
    if session[:user_id]
      session.clear
      # binding.pry
      erb :"/advocates/logout" 
    else
      erb :"/advocates/registration"
    end
  end
  
  post "/advocates" do
    @advocate = Advocate.create params[:advocate]
    if @advocate.valid?
      session[:user_id] = @advocate.id
      flash[:message] = "Congratulations #{@advocate.name}, Your Account Has Been Created SuccessFully."
      redirect to "/advocates/#{ @advocate.slug }"
    else
      erb :"/advocates/new"
    end
  end
 
  post '/login' do
    advocate = Advocate.find_by email: params[:email]
    if advocate && advocate.authenticate(params[:password])
      # binding.pry
      session[:user_id] = advocate.id
      redirect to "/advocates/#{ advocate.slug }"
    else
      flash[:message] = "Account Not Found, Please Make Sure You Type In Your Credentials Correctly"
      redirect to "/advocates/registration"
    end
  end

  get "/advocates/registration" do
    if session[:user_id]
      session.clear
      erb :"/advocates/logout" 
    else
      erb :"/advocates/registration"
    end
  end

  get "/advocates/:slug/edit" do
    @advocate = Advocate.find_by_slug params[:slug]
    erb :"/advocates/edit"
  end

  get "/advocates/:slug" do
    @advocate = Advocate.find_by_slug params[:slug]
    if @advocate && @advocate.id == session[:user_id]
      erb :"/advocates/show"
    else
      flash[:error] = "Please Sign In To See Your Account"
      erb :"/advocates/registration"
    end
    # binding.pry
  end

  delete "/advocates/:id/delete" do
    redirect "/advocates"
  end
end
