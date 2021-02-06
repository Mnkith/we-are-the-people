class AdvocatesController < ApplicationController
  use Rack::Flash
  # GET: /advocates
  get "/advocates" do
    @advocate = Advocate.find session[:user_id]
    erb :"/advocates/index"
  end

  # GET: /advocates/new
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
  
  # POST: /advocates
  post "/advocates" do
    
    @advocate = Advocate.create params[:advocate]
    # advocate.save
    if @advocate.valid?
      session[:user_id] = @advocate.id
      flash[:message] = "Congratulations #{@advocate.name}, Your Account Has Been Created SuccessFully."
      redirect to "/advocates/#{ @advocate.slug }"
    else
      erb :"/advocates/new"
    end
  end
  # patch "/advocates" do
  #   binding.pry
  #   @advocate = Advocate.find_by_slug params[:slug]
  #   @advocate.update params[:advocate]
  #   redirect "/advocates/#{ @advocate.slug }"
  # end

  post '/login' do
    @advocate = Advocate.find_by email: params[:email], password: params[:password]
    if @advocate
      binding.pry
      session[:user_id] = @advocate.id
      redirect to "/advocates/#{ @advocate.slug }"
    else
      flash[:message] = "Account Not Found, Please Make Sure You Type In Your Credentials Correctly"
      erb :"/advocates/registration"
    end
  end

  get "/advocates/registration" do
    if session[:user_id]
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
    erb :"/advocates/edit"
  end

  # PATCH: /advocates/5
  

  get "/advocates/:slug" do
    @advocate = Advocate.find_by_slug params[:slug]
    if @advocate && session[:user_id]
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

  # patch "/advocates/:id" do
  #   binding.pry
  #   @advocate = Advocate.find params[:id]
  #   @advocate.update params[:advocate]
  #   redirect "/advocates/#{ @advocate.slug }"
  # end
end
