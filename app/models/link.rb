require 'uri'

class Link < ActiveRecord::Base
  validates :url, presence: true#, :message => "You need to enter a URL"
  validates :name, presence: true#, :message => "You need to give the URL a name"
  validates :url, format: { with: URI.regexp}#, :message => "Not a properly formatted URL, make sure to include \"http://\" or \"https://\""}
  #validates :url, :url => true
  validates :url, uniqueness: true#, :message => "This Link already exists" 
    
  def self.all_categories
    %w(Internships Grants Jobs Inspiration Other)
  end
  
  # def valid_url
  #   uri = URI.parse(url)
  #   uri.kind_of?(URI::HTTP)
  # rescue URI::InvalidURIError
  #   false
  # end
  
end