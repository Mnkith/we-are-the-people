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
  
  # POST: /advocates
  post "/advocates" do
    @user = Advocate.create params[:advocate]
    # user.save
    if @user.valid?
      session[:id] = @user.id
      redirect to "/advocates/#{ @user.slug }"
    else
      erb :"/advocates/new"
    end
  end
  
  get "/advocates/registration" do
    session[:id] ? (erb :"/advocates/logout") : (erb :"/advocates/registration")
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
