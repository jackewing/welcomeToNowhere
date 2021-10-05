class ArtistsController < ApplicationController
  layout 'welcome_to_nowhere'

  def index
    @artists = artists
    @colours = colours
  end

  def show
    @artists = artists
    @colours = colours
    @index = params[:id].to_i
    @background_colour = Colours.white
  end

  private

  def artists
    Airtable.fetch(:artists)
  end

  def colours
    [
      'rgba(243, 166, 131,1.0)',
      'rgba(247, 215, 148,1.0)',
      'rgba(119, 139, 235,1.0)',
      'rgba(231, 127, 103,1.0)',
      'rgba(207, 106, 135,1.0)',
      'rgba(120, 111, 166,1.0)',
      'rgba(248, 165, 194,1.0)',
      'rgba(99, 205, 218,1.0)',
      'rgba(234, 134, 133,1.0)',
      'rgba(89, 98, 117,1.0)',
    ]
  end
end
