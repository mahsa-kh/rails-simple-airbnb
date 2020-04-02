class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end


  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create(flat_params)
    redirect_to root_path

  end

  def destroy
    @flat = Flat.find(params[:id].to_i)

    @flat.destroy
    redirect_to root_path
  end

  def show
    @flat = Flat.find(params[:id].to_i)
    @review = Review.new
  end

  def edit
    @flat = Flat.find(params[:id].to_i)
  end

  def update
    @flat = Flat.find(params[:id].to_i)
    if @flat.update(flat_params)
      #redirect_to @flat, notice: 'Flat was successfully updated.'
      redirect_to flat_path(@flat.id)
    else
      render :edit
    end
  end


  # def top
  # end

  private
  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price_per_night, :number_of_guests)
  end
end
