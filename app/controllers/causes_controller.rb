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
    @cause = Cause.find_by_slug params[:slug]
    erb :"/causes/edit"
  end

  patch "/causes/:slug" do
    @cause = Cause.find_by_slug params[:slug]
    @cause.update params[:cause]
    if @cause.valid? 
      flash[:message] = "The Cause Was Updated Successfully."
      redirect "/causes/#{ @cause.slug }"
    else
      flash[:errors] =  @cause.errors
      # binding.pry
      redirect to "/causes/#{ @cause.slug }/edit"
    end
  end

  delete "/causes/:id/delete" do
    redirect "/causes"
  end
end
