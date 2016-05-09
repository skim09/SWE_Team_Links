require 'uri'

class Link < ActiveRecord::Base
  
  validates :url, presence: true, uniqueness: true, format: { with: URI.regexp, message: "must be in the format: http://www.example.com"} #, message: "You need to enter a URL"
  validates :name, presence: true, uniqueness: true#, message: "You need to give the URL a name"
 #, :message => "Not a properly formatted URL, make sure to include \"http://\" or \"https://\""}
  #validates :url, :url => true
    
  def self.all_categories
    return ["Get Acclimated & Get Inspired", "Get Smart & Get Informed", "Get Connected & Get Taught", "Get Experience", "Get Organized", "Get Funded"]
  end
  
  # def valid_url
  #   uri = URI.parse(url)
  #   uri.kind_of?(URI::HTTP)
  # rescue URI::InvalidURIError
  #   false
  # end
  
end