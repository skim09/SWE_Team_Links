require 'rails_helper'

describe LinksController, :type => :controller do
   
   describe 'add new link' do
    
    context 'all fields correct' do
      it 'should add a new link' do
        @fake_link = double("Link", :name => "Google", :url => "www.google.com", :category => "search", :upvotes => 0)
        allow(Link).to receive(:create!).and_return(@fake_link)
        #this line should be edited probably
        post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        expect(response).to redirect_to(links_path)
      end
    end
    
    context 'invalid URL' do
      it 'should reject the url' do
        @fake_link = double("Link", :name => "Google", :url => "google", :category => "search", :upvotes => 0)
        #this line should be edited
        allow(Link).to receive(:create!).and_return(false)
        post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'empty name' do
      it 'should reject the URL' do
        @fake_link = double("Link", :name => "", :url => "www.google.com", :category => "search", :upvotes => 0)
        #this line should be edited
        allow(Link).to receive(:create!).and_return(false)
        post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'not unique URL' do
        it 'should reject the URL' do
        #add google to the fake database
        @fake_link = double("Link", :name => "Google", :url => "www.google.com", :category => "search", :upvotes => 0)
        allow(Link).to receive(:create!).and_return(false)
        #this line should be edited probably
        post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        #maybe should go back to new_link_path
        expect(response).to redirect_to(new_link_path)
      end
    end
  end
  
  describe 'expanding a category' do
    it 'should show a category after clicking it' do
      
    end
  end
  
  describe 'collapsing a category' do
    it 'should hide a category after clicking it' do
        
    end
  end
    
end