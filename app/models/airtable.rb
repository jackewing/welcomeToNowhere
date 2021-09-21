class Airtable
  @table_id = 'app47yxhBJJGy9O2V'

  def self.fetch(resource)
    # caches if in development
    return ENV['RACK_ENV'] == 'development' && self.send(resource)

    Rails
      .cache
      .fetch([self, resource], expires_in: 10.hours) { self.send(resource) }
  end

  def self.wednesday_image
    img =
      Airrecord
        .table(ENV['airtable_key'], @table_id, 'Wednesday main')
        .all
        .map(&:fields)
        .filter { |record| record['Attachments'].present? }
        .first

    image(img, 'Attachments')
  end

  def self.wednesday_gallery
    Airrecord
      .table(ENV['airtable_key'], @table_id, 'Wednesday Gallery')
      .all
      .map do |image|
        { name: image['Name'], image_url: image(image, 'Attachments') }
      end
  end

  def self.upcoming_acts
    Airrecord
      .table(ENV['airtable_key'], @table_id, 'Eyegum wednesday content')
      .all
      .map(&:fields)
  end

  def self.latest_news
    Airrecord
      .table(ENV['airtable_key'], @table_id, 'Eyegum news items')
      .all
      .map do |item|
        [item.fields['news item'], item.fields['copy'], image(item, 'photo')]
      end
  end

  def self.homepage_blurb
    Airrecord
      .table(ENV['airtable_key'], @table_id, 'Eyegum website home page content')
      .all
      .first
      .fields[
      'home page blurb'
    ]
  end

  def self.artists
    Airrecord
      .table(ENV['airtable_key'], @table_id, 'Bands Live')
      .all
      .map do |artist|
        {
          name: artist['Name'],
          image_url: image(artist, 'Portrait Press Shot'),
          city:
            if artist['Hometown'].present?
              artist['Hometown']
            else
              'Hometown not provided.'
            end,
          description:
            artist['Bio'].present? ? artist['Bio'] : 'Bio not provided.',
          links:
            if artist['Links'].present? && URI.regexp.match?(artist['Links'])
              URI.regexp.match(artist['Links'])[0]
            else
              'Links not provided.'
            end,
          long_description:
            if artist['Bio (Extended)'].present?
              artist['Bio (Extended)']
            else
              'Extended bio not provided.'
            end,
          genre:
            artist['Genre'].present? ? artist['Genre'] : 'Genre not specified.',
          performer_details:
            if artist['Performer Details'].present?
              artist['Performer Details']
            else
              'Performer details not provided.'
            end,
        }
      end
  end

  def self.wtn_gallery
    Airrecord.table(
      ENV['airtable_key'],
      @table_id,
      'Welcome to Nowhere Gallery',
    )
  end

  private

  def self.image(record, identifier)
    if record[identifier].present?
      if record[identifier][0]['thumbnails'].present?
        record[identifier][0]['thumbnails']['large']['url']
      end
    end
  end
end
