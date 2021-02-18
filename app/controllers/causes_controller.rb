class CausesController < ApplicationController

  
  get "/causes" do
    erb :"/causes/index"
  end

  get "/causes/new" do
    erb :"/causes/new"
  end
  
  post "/causes" do
    cause = Cause.create params[:cause]
    if cause.valid?
      flash[:message] = "#{cause.name} Has Been Created Successfully."
      redirect to "/causes/#{ cause.slug }"
    else
      flash[:errors] =  cause.errors
      redirect to  "/causes/new"
    end
  end

  get "/causes/:slug" do
    @cause = Cause.find_by_slug params[:slug]
    erb :"/causes/show"
  end
  
  get "/causes/:slug/edit" do
    @cause = Cause.find_by_slug params[:slug]
    erb :"/causes/edit"
  end

  patch "/causes/:slug" do
    cause =  Cause.find_by_slug params[:slug]
    cause.update params[:cause]
    if cause.valid? 
      flash[:message] = "The Cause Was Updated Successfully."
      redirect "/causes/#{ cause.slug }"
    else
      flash[:errors] =  cause.errors
      redirect to "/causes/#{ Cause.find_by_slug(params[:slug]).slug }/edit"
    end
  end
  
  delete "/causes/:slug" do
    Cause.find_by_slug(params[:slug]).delete
    redirect "/causes"
  end
end
