class AdvocatesController < ApplicationController

  # GET: /advocates
  get "/advocates" do
    erb :"/advocates/index.html"
  end

  # GET: /advocates/new
  get "/advocates/new" do
    erb :"/advocates/new.html"
  end

  post "/advocates/registration" do
    session[:id] ? (erb :"/advocates/logout") : (erb :"/advocates/registration")
  end

  # POST: /advocates
  post "/advocates" do
    user = Advocate.create params[:advocate]
    # user.save
    binding.pry
    redirect "/advocates"
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
