class MotorbikesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @Motorbikes = Motorbike.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @Motorbikes.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { motorbike: @motorbike }),
        marker_html: render_to_string(partial: "marker", locals: { motorbike: @motorbike })
      }
    end
    if params[:query].present?
      @motorbikes = Motorbike.search_by_name_and_brand_and_color_and_year_and_price(params[:query])
      # ca permet de faire une recherche par nom et par marque
      # on ajoutes une recherche par couleur et par année et par prix
      # ca donne ça
    else
      @motorbikes = Motorbike.all
    end
  end

  def new
    @motorbike = Motorbike.new
    @booking = Booking.new
  end

  def create
    @motorbike = Motorbike.new(motorbike_params)
    @motorbike.user = current_user
    if @motorbike.save
      redirect_to motorbike_path(@motorbike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @motorbike = Motorbike.find(params[:id])
    @booking = Booking.new(motorbike: @motorbike)
  end

  def edit
    @motorbike = Motorbike.find(params[:id])
  end

  def update
    if @motorbike.update(motorbike_params)
      redirect_to motorbike_path(@motorbike)
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
    params.require(:motorbike).permit(:name, :brand, :color, :description, :year, :price, :user_id, :photo)
  end
end
