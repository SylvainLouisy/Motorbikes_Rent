class MotorbikesController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    @motorbikes = Motorbike.all
  end

  def new
    @motorbike = Motorbike.new
  end

  def create
    @motorbike = Motorbike.new(motorbike_params)
    if @motorbike.save
      redirect_to @motorbike
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @motorbike = Motorbike.find(params[:id])
  end

  def edit
    @motorbike = Motorbike.find(params[:id])
  end

  def update
    @motorbike = Motorbike.find(params[:id])
    if @motorbike.update(motorbike_params)
      redirect_to @motorbike
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @motorbike = Motorbike.find(params[:id])
  #   @motorbike.destroy
  #   redirect_to motorbikes_path, status: :see_other
  # end

  private

  def set_motorbike
    @motorbike = Motorbike.find(params[:id])
  end

  def motorbike_params
    params.require(:motorbike).permit(:name, :brand, :color, :year, :price, :user_id)
  end
end
