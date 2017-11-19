require "dentally_api/version"
require "rest-client"
require "json"

class DentallyApi
  attr_accessor :access_token, :host
  def initialize( access_token:, host: )
    self.access_token = access_token
    self.host = host
  end

  def practice
    practice_url = "#{host}/v1/practice"
    practice_hash = JSON.parse(get(practice_url))
    to_struct(practice_hash["practice"])
  end

  def errors
    []
  end

  private
  def authorization
    { authorization: "Bearer #{access_token}" }
  end

  def get(url)
    RestClient.get(url, { authorization: "Bearer #{access_token}" })
  end

  def to_struct(hash)
    Struct.new(*hash.keys.map(&:to_sym)).new(*hash.values)
  end
end

