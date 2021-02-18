class DonationsController < ApplicationController

  post "/donations" do
    advocate = current_user
    #prefer different amount over preset amount
    donation = !params[:different].empty? ? Donation.create(amount: params[:different]) : Donation.create(amount: params[:preset])
    if donation.valid?
      donation.advocate = advocate  
      cause = Cause.find session[:cause_id]
      donation.cause = cause
      cause.current += donation.amount
      cause.save
      donation.save
      redirect to "/donations/#{donation.id}"
    else
      flash[:errors] = donation.errors.full_messages
      redirect to "/donations/new"
    end
  end
  
  get "/donations/new" do
    erb :"/donations/new.html"
  end

  get "/donations/:id" do
    @donation = Donation.find params[:id]
    erb :"/donations/show.html"
  end
  
end
