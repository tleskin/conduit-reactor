module Helpers
  def credentials
    {}.tap do |credentials|
      credentials[:token] = '9999999'
    end
  end

  def callback_url
    'www.somewhere.com'
  end
end

RSpec.configure do |config|
  config.include Helpers
end
