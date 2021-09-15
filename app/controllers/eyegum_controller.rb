class EyegumController < ApplicationController
  layout 'eyegum'

  def index
    @background_colour = Colours.avocado
    @latest_news = Airtable.fetch(:latest_news).slice(0, 2)
    @blurb = Airtable.fetch(:homepage_blurb)
  end

  def free_wednesdays
    @background_colour = Colours.white
    @upcoming_acts =
      Airtable
        .fetch(:upcoming_acts)
        .filter { |act| act['Event title'].present? }
  end

  def other_events; end

  def about_us
    @background_colour = Colours.avocado
  end
end
