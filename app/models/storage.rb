class Storage
  def initialize(params)
    @bucket_name = 'eyegum-images'
  end

  def self.parse(data)
    return [1]
  end

  def upload(data)
    data = JSON.parse(data)

    imageUrl = URI.parse(data['imageUrl'])
    recordID = data['recordID']

    local_file_obj = StringIO.new Net::HTTP.get_response(imageUrl).body

    # The ID of your GCS object
    file_name = recordID

    storage = Google::Cloud::Storage.new
    bucket = storage.bucket @bucket_name, skip_lookup: true

    local_file_obj.rewind
    bucket.create_file local_file_obj, file_name
    byebug
    puts "Uploaded data stream as #{file_name} in bucket #{@bucket_name}"
  end

  def download
    # The path to your file to upload
    local_file_path = 'test.txt'

    # The ID of your GCS object
    file_name = 'test.txt'

    storage = Google::Cloud::Storage.new
    bucket = storage.bucket @bucket_name, skip_lookup: true
    file = bucket.file file_name

    file.download local_file_path

    puts "Downloaded #{file.name} to #{local_file_path}"
  end
end
