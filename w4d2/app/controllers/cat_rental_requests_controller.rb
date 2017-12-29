class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    render :new
  end

  def create
    @rental_request = CatRentalRequest.new(rental_request_params)

    if @rental_request.save
      redirect_to cat_url(@rental_request.cat_id)
    else
      render json: @rental_requests.errors.full_messages
    end
  end


  def rental_request_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date)
  end
end
