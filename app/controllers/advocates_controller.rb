class AdvocatesController < ApplicationController

  # GET: /advocates
  get "/advocates" do
    erb :"/advocates/index.html"
  end

  # GET: /advocates/new
  get "/advocates/new" do
    erb :"/advocates/new"
  end

  post "/advocates/registration" do
    session[:id] ? (erb :"/advocates/logout") : (erb :"/advocates/registration")
  end
  
  get "/advocates/registration" do
    session[:id] ? (erb :"/advocates/logout") : (erb :"/advocates/registration")
  end
  # POST: /advocates
  post "/advocates" do
    @user = Advocate.create params[:advocate]
    # user.save
    if @user.valid?
      erb :"/advocates"
    else
      @errors = @user.errors.full_messages
      # binding.pry
      erb :"/advocates/new"
    end

  end

  # GET: /advocates/5
  get "/advocates/:id" do
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
