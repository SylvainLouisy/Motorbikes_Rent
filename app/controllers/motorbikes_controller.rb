class MotorbikesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @Motorbikes = Motorbike.all
    # The `geocoded` scope filters only flats with coordinates

    if params[:query].present?
      @motorbikes = Motorbike.search_by_name_and_brand_and_color_andyear_and_price_and_address(params[:query])
      # ca permet de faire une recherche par nom et par marque
      # on ajoutes une recherche par couleur et par année et par prix
      # ca donne ça
    else
      @motorbikes = Motorbike.all
    end
  end

  def new
    @motorbike = current_user.motorbikes.build
    @booking = Booking.new
  end

  def create
    @motorbike = current_user.motorbikes.build(motorbike_params)
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
    @Motorbikes = Motorbike.all
    @review = Review.new

    markers = @Motorbikes.geocoded.map do |motorbike|
      if motorbike == @motorbike
        {
            lat: motorbike.latitude,
            lng: motorbike.longitude,
            info_window_html: render_to_string(partial: "info_window", locals: { motorbike: motorbike }),
            marker_html: render_to_string(partial: "marker", locals: { motorbike: motorbike })
        }
      end
    end

    @markers = []
    markers.each do |marker|
      next if marker.nil?
      @markers << marker
    end
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
    params.require(:motorbike).permit(:name, :brand, :color, :description, :address, :year, :price, :user_id, :photo)
  end
end
