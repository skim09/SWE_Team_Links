require 'uri'

class Link < ActiveRecord::Base
  validates :url, presence: {:message => "You need to enter a URL"}
  validates :name, presence: {:message => "You need to give the URL a name"}
    
  def self.all_categories
    %w(Internships Grants Jobs Inspiration Other)
  end
end