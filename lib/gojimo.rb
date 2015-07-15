require "gojimo/version"
require "gojimo/api_handler"

module Gojimo
  API_URL = "https://api.gojimo.net/api/v4/qualifications"

  class << self
    def call
      ApiHandler.new(:get, API_URL).execute
    end
  end
end
