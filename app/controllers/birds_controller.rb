class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  # POST /birds
  def create
    # create a new bird
    bird = Bird.create(name: params[:name], species: params[:species])
    # send the new bird in the response
    render json: bird ,status: :created
    # byebug
  end

end