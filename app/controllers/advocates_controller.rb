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
    
    @advocate = Advocate.create params[:advocate]
    # advocate.save
    if @advocate.valid?
      session[:id] = @advocate.id
      flash[:message] = "Congratulations #{@advocate.name}, Your Account Has Been Created SuccessFully."
      redirect to "/advocates/#{ @advocate.slug }"
    else
      erb :"/advocates/new"
    end
  end
  
  post '/login' do
    @advocate = Advocate.find_by email: params[:email], password: params[:password]
    if @advocate
      session[:id] = @advocate.id
      redirect to "/advocates/#{ @advocate.slug }"
    else
      flash[:message] = "Account Not Found, Please Make Sure You Type In Your Credentials Correctly"
      erb :"/advocates/registration"
    end
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
  

  # GET: /advocates/5/edit
  get "/advocates/:slug/edit" do
    @advocate = Advocate.find_by_slug params[:slug]
    erb :"/advocates/edit.html"
  end

  # PATCH: /advocates/5
  patch "/advocates/:slug" do
    binding.pry
    @advocate = Advocate.find_by_slug params[:slug]
    @advocate.update params[:advocate]
    redirect "/advocates/#{ @advocate.slug }"
  end

  get "/advocates/:slug" do
    @advocate = Advocate.find_by_slug params[:slug]
    if @advocate && session[:id]
      erb :"/advocates/show"
    else
      flash[:message] = "Please Sign In To See Your Account"
    end
    # binding.pry
  end

  # DELETE: /advocates/5/delete
  delete "/advocates/:id/delete" do
    redirect "/advocates"
  end
end
