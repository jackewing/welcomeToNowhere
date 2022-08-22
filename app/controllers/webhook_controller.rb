class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    data = request.body.read
    storage = Storage.new
    storage.upload(data)

    render plain: 'OK'
  end
end
