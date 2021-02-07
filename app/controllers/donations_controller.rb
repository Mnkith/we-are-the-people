class DonationsController < ApplicationController

  # GET: /donations
  get "/donations" do
    erb :"/donations/index.html"
  end

  # GET: /donations/new
  get "/donations/new" do
    erb :"/donations/new.html"
  end

  # POST: /donations
  post "/donations" do
    @advocate = Advocate.find session[:user_id]
    
    binding.pry
    redirect "/donations"
  end

  # GET: /donations/5
  get "/donations/:id" do
    erb :"/donations/show.html"
  end

  # GET: /donations/5/edit
  get "/donations/:id/edit" do
    erb :"/donations/edit.html"
  end

  # PATCH: /donations/5
  patch "/donations/:id" do
    redirect "/donations/:id"
  end

  # DELETE: /donations/5/delete
  delete "/donations/:id/delete" do
    redirect "/donations"
  end
end
