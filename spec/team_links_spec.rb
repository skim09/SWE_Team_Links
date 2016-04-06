require 'rails_helper'

describe LinksController, :type => :controller do
   
  describe 'add new link' do
    
    context 'all fields correct' do
      it 'should validate the url' do
        expect(Link.new(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)).to be_valid
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
        expect(Link.new(:name => "Google", :url => "google", :category => "search", :upvotes => 0)).to_not be_valid
        post :create, :link => {:name => "Google", :url => "google.com", :category => "search", :upvotes => 0} 
        expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'empty name' do
      it 'should reject the URL' do
        expect(Link.new(:name => "", :url => "http://www.google.com", :category => "search", :upvotes => 0)).to_not be_valid
        post :create, :link => {:name => "", :url => "http://www.google.com", :category => "search", :upvotes => 0} 
        expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'empty url' do
      it 'should reject the URL' do
        expect(Link.new(:name => "google", :url => "", :category => "search", :upvotes=> 0)).to_not be_valid
        post :create, :link => {:name => "Google", :url => "", :category => "search", :upvotes => 0} 
        expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'not unique URL' do
        it 'should reject the URL' do
          Link.create!(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)
          expect(Link.new(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)).to_not be_valid
          post :create, :link => {:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0} 
          expect(response).to redirect_to(new_link_path)
      end
    end
  end
  
  describe 'index' do
    it 'should display all links' do
      get :index
    end
  end
  
  describe 'show' do
    it 'should show a link' do
      Link.create!(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)
      get :show, :id => 1
    end
  end
  
  describe 'new' do
    it 'should show the new page' do
      get :new
    end
  end
  
  describe 'edit' do
    it 'should show the edit page' do
      Link.create!(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)
      get :edit, :id => 1
    end
  end
  
  describe 'update' do
    it 'should go to the update page' do
      Link.create!(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)
      get :update, :id => 1
    end
  end
  
  describe 'destroy' do
    it 'should destroy a link' do
      Link.create!(:name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0)
      get :destroy, :id => 1
    end
  end
  
end