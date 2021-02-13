class CausesController < ApplicationController

  
  get "/causes" do
    erb :"/causes/index"
  end

  get "/causes/new" do
    erb :"/causes/new"
  end
  
  post "/causes" do
    # flash.clear
    # session[:errors]&.clear
    # params[:cause][:email].downcase!
    cause = Cause.create params[:cause]
    if cause.valid?
      # session[:user_id] = cause.id
      flash[:message] = "#{cause.name} Has Been Created SuccessFully."
      redirect to "/causes/#{ cause.slug }"
    else
      flash[:errors] =  cause.errors
      # binding.pry
      redirect to  "/causes/new"
    end
  end

  get "/causes/:slug" do
    @cause = Cause.find_by_slug params[:slug]
    # binding.pry
    erb :"/causes/show"
  end
  
  get "/causes/:slug/edit" do
    @cause = Cause.find_by_slug params[:slug]
    erb :"/causes/edit"
  end

  patch "/causes/:slug" do
    cause =  Cause.find_by_slug params[:slug]
    
    cause.update params[:cause]
    # binding.pry
    if cause.valid? 
      flash[:message] = "The Cause Was Updated Successfully."
      redirect "/causes/#{ cause.slug }"
    else
      flash[:errors] =  cause.errors
      # binding.pry
      #call original object to avoid blank entry route missdirect like -/causes//edit, delete rquired from edit view to see effect
      redirect to "/causes/#{ Cause.find_by_slug(params[:slug]).slug }/edit"
    end
  end

  delete "/causes/:id/delete" do
    redirect "/causes"
  end
end
