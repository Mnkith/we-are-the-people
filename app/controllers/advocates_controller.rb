class AdvocatesController < ApplicationController
  get "/advocates" do
    erb :"/advocates/index"
  end

  get "/advocates/new" do
    erb :"/advocates/new"
  end
  
  post "/advocates" do
    params[:advocate][:email].downcase!
    advocate = Advocate.create params[:advocate]
    if advocate.valid?
      session[:user_id] = advocate.id
      flash[:message] = "Congratulations #{advocate.name}, Your Account Has Been Created SuccessFully."
      redirect to "/advocates/#{ advocate.slug }"
    else
      flash[:errors] =  advocate.errors
      redirect to  "/advocates/new"
    end
  end
 
  post '/login' do
    advocate = Advocate.find_by email: params[:email].downcase

    if advocate && advocate.authenticate(params[:password])
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
    # binding.pry
    if @advocate && @advocate.id == session[:user_id]
      erb :"/advocates/show"
    else
      flash[:error] = "Please Sign In To See Your Account"
      erb :"/advocates/registration"
    end
  end
cccc
  patch "/advocates/:slug" do   
    advocate = Advocate.find_by_slug params[:slug]
    advocate.update params[:advocate]
    if advocate.valid?   
      flash[:message] = "Your Account Was Updated Successfully."
      redirect "/advocates/#{ advocate.slug }"
    else
      flash[:errors] =  advocate.errors
      binding.pry
      redirect to "/advocates/#{ Advocate.find_by_slug(params[:slug]).slug }/edit"

    end
  end

  delete "/advocates/:slug" do
    Advocate.find_by_slug(params[:slug]).delete
    reset
    redirect "/causes"
  end
end
