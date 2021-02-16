class DonationsController < ApplicationController

  # GET: /donations
  get "/donations" do
    erb :"/donations/index.html"
  end

  # GET: /donations/new
  get "/donations/new" do
    # binding.pry
    erb :"/donations/new.html"
  end

  # POST: /donations
  post "/donations" do
    @advocate = current_user
    #prefer different amount over preset amount
    @donation = !params[:different].empty? ? Donation.create(amount: params[:different]) : Donation.create(amount: params[:preset])
    if @donation.valid?
      @donation.advocate = @advocate  
      cause = Cause.find session[:cause_id]
      cause.current += @donation.amount
      if cause.current >= cause.goal 
        cause.met = true
        cause.current = cause.goal 
      end
      @donation.advocate_name = @advocate.name
      @donation.cause_name = cause.name
      # binding.pry
      cause.save
      @donation.cause = cause
      @donation.save
      redirect to "/donations/#{@donation.id}"
    else
       erb :"/donations/new.html"
    end
  end

  # GET: /donations/5
  get "/donations/:id" do
    @donation = Donation.find params[:id]
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
