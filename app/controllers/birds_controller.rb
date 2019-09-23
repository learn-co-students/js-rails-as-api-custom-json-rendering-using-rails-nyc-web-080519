class BirdsController < ApplicationController
  # def index
  #   @birds = Bird.all
  #   render json: @birds
  # end
  #         ^ this code actually gives us TOO MUCH data back. So...

  # version 2 that allows us to narrow down to the keys of birds that we actually want
  # NOTE: we can also use "except" here to utilize the inverse operation
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end


  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird
  # end

  # def show  # we update the show method to only include the relevant data
    # This ignores created_at and updated_at

    # bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
  # end

  # version 3, using slice. Slice is a method that returns
  # a new hash with only the specified keys from the targetted obj
  def show
    bird = Bird.find_by(id: params[:id])
    render json: bird.slice(:id, :name, :species)
  end

end