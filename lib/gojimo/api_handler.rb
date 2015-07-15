require 'json'

class ApiHandler

  def initialize(http_verb, api_url, params = {})
    @api_url    = api_url
    @http_verb  = http_verb
    @params     = params
  end

  def execute
    uri = URI(@api_url)
    if @http_verb == :get
      uri.query = URI.encode_www_form(@params)
      @response = Net::HTTP.get_response(uri)
    end
    parser_response
  end

  private
  def parser_response
    case @response.code
    when "200"
      JSON.parse(@response.body)
    else
      @response.body
    end
  end
end
