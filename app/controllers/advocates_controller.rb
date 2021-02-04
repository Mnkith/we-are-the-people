class AdvocatesController < ApplicationController

  # GET: /advocates
  get "/advocates" do
    erb :"/advocates/index.html"
  end

  # GET: /advocates/new
  get "/advocates/new" do
    erb :"/advocates/new.html"
  end

  # POST: /advocates
  post "/advocates" do
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
