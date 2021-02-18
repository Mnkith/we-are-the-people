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
      # @donation.advocate_name = @advocate.name
      # @donation.cause_name = cause.name
      # binding.pry
      @donation.cause = cause
      # cause.donations << @donation
      # cause.save
      # @advocate.donations << @donation
      # @advocate.save
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
end
