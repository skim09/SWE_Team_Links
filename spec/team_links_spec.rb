require 'rails_helper'

describe LinksController, :type => :controller do
   
  describe 'add new link' do
    
    context 'all fields correct' do
      it 'should validate the url' do
        Link.new(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0).should be_valid
      end
      
      it 'should add a new link' do
        @fake_link = double("Link", :name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)
        allow(Link).to receive(:create!).and_return(@fake_link)
        post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        expect(response).to redirect_to(links_path)
      end
    end
    
    
    context 'invalid URL' do
      it 'should reject the url' do
        Link.new(:name => "Google", :url => "google", :category => "search", :upvotes => 0).should_not be_valid
        # @fake_link = double("Link", :name => "Google", :url => "google", :category => "search", :upvotes => 0).as_null_object
        # #this line should be edited
        # expect(Link).to receive(:create!).and_return(false)
        # post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        # expect(response).to redirect_to(links_path)
      end
    end
    
    context 'empty name' do
      it 'should reject the URL' do
        Link.new(:name => "", :url => "http://www.google.com", :category => "search", :upvotes => 0).should_not be_valid
        # @fake_link = double("Link", :name => "", :url => "http://www.google.com", :category => "search", :upvotes => 0)
        # #this line should be edited
        # allow(Link).to receive(:create!).and_return(@fake_link)
        # post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        # expect(response).to redirect_to(links_path)
      end
    end
    
    context 'empty url' do
      it 'should reject the URL' do
        Link.new(:name => "google", :url => "", :category => "search", :upvotes=> 0).should_not be_valid
      end
    end
    
    context 'not unique URL' do
        it 'should reject the URL' do
          Link.create!(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)
          Link.new(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0).should_not be_valid
        # #add google to the fake database
        # @fake_link = double("Link", :name => "Google", :url => "www.google.com", :category => "search", :upvotes => 0)
        # allow(Link).to receive(:create!).and_return(@fake_link)
        # #this line should be edited probably
        # post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        # #maybe should go back to new_link_path
        # expect(response).to redirect_to(links_path)
      end
    end
  
  # describe 'expanding a category' do
  #   it 'should show a category after clicking it' do
      
  #   end
  # end
  
  # describe 'collapsing a category' do
  #   it 'should hide a category after clicking it' do
        
  #   end
  end
    
end