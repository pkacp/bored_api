class ObjectFromApi
  require 'net/http'
  require 'json'
  require 'uri'

  def initialize(activity_class, endpoint)
    @activity_class = activity_class
    @endpoint = endpoint
  end

  def call
    return nil unless @activity_class && @endpoint
    res = get_from_endpoint
    params = parse_response res
    @activity_class.new(params)
  end

  private

  def get_from_endpoint
    uri = URI.parse(@endpoint)
    Net::HTTP.get(uri)
  end

  def parse_response(res)
    JSON.parse res
  end
end