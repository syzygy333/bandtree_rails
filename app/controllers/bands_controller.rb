class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
  end

  private

  def band_params
    params.require(:band).permit(
      :name, :record_label, :year_formed, :year_disbanded,
      :reunion_start, :reunion_end, :official_link, :wiki_link,
      :biography, :private?
    )
  end
end
