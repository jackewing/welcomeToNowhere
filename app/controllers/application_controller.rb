class ApplicationController < ActionController::Base
  def migrate
    @table_id = 'app47yxhBJJGy9O2V'

    tables = [
      "W2N FAQ's",
      'Wednesday main',
      'Wednesday Gallery',
      'Eyegum wednesday content',
      'Eyegum news items',
      'Eyegum website home page content',
      'Bands Live',
      'Welcome to Nowhere Gallery',
    ]

    results = []
    tables.each do |table|
      results.push Airrecord.table(ENV['airtable_key'], @table_id, table).all
    end

    # getters = Airtable.methods - Class.methods - %i[image fetch]
    # results = getters.map { |getter| Airtable.fetch(getter) }

    urls = URI.extract(results.to_s).filter { |s| s.include?('airtable') }.uniq
    byebug
    urls
  end
end
