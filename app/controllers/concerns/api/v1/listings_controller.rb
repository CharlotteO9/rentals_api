class Api::V1::ListingsController < ApplicationController
  def index
    @listings = Listing.all
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: @listings }, status: :ok
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: { status: 'SUCCESS', message: 'Listing is saved', data: @listing }, status: :ok
    else
      render json: { status: 'Error', message: 'Listing is not saved', data: @listing.errors }, status: 400
    end
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      render json: { status: 'SUCCESS', message: 'Listing is updated', data: @listing }, status: :ok
    else
      render json: { status: 'Error', message: 'Listing is not updated', data: @listing.errors }, status: 400
    end
  end

  def delete
    @listing = Listing.find(params[:id])
    @listing.destroy
    render json: { status: 'SUCCESS', message: 'Listing successfully deleted', data: @listing }, status: 200
  end

  private

  def listing_params
    params.permit(:num_rooms)
  end
end
