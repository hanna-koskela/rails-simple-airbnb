class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @flat = flat.new # needed to instantiate the form_for
  end

  def create
    @flat = flat.new(flat_params)
    @flat.save

    # no need for app/views/flats/create.html.erb
    redirect_to flat_path(@flat)
  end

  def edit
    @flat = flat.find(params[:id])
  end

  def update
    @flat = flat.find(params[:id])
    @flat.update(params[:flat])
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = flat.find(params[:id])
    @flat.destroy

    # no need for app/views/flats/destroy.html.erb
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
