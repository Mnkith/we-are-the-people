class CausesController < ApplicationController

  
  get "/causes" do
    erb :"/causes/index"
  end

  get "/causes/new" do
    erb :"/causes/new"
  end
  
  post "/causes" do
    redirect "/causes"
  end

  get "/causes/:slug" do
    @cause = Cause.find_by_slug params[:slug]
    # binding.pry
    erb :"/causes/show"
  end
  
  get "/causes/:slug/edit" do
    erb :"/causes/edit"
  end

  patch "/causes/:id" do
    redirect "/causes/:id"
  end

  delete "/causes/:id/delete" do
    redirect "/causes"
  end
end
