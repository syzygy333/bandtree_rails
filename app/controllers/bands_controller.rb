class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
    @band.portrait = params[:file]
  end

  def create
    @band = Band.new(band_params)
    if current_user == nil
      flash[:alert] = "You must be signed in to do that."
      render :new
    elsif @band.save
      flash[:success] = "Band added."
      redirect_to band_path(@band)
    else
      flash[:alert] = @band.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def destroy
    @band = Band.find(params[:id])
    if current_user
      @band.destroy
      flash[:success] = "Band deleted."
      redirect_to root_path
    else
      flash[:alert] = "You must be signed in to do that."
      redirect_to band_path(@band)
    end
  end

  private

  def band_params
    params.require(:band).permit(
      :name, :record_label, :year_formed, :year_disbanded,
      :reunion_start, :reunion_end, :official_link, :wiki_link,
      :biography, :private?, :portrait
    )
  end
end
