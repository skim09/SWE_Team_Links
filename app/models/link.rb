require 'uri'

class Link < ActiveRecord::Base
  def create!(link_params)
    #add invalid url
    if(link_params.name == "" or link_params.name == nil or not Link.where(:url => link_params.url).blank?)
      return false    
    else
      super
    end
  end
    
  def self.all_categories
    %w(Internships Grants Jobs Inspiration Other)
  end
end