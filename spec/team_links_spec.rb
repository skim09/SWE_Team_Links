require 'rails_helper'
require 'rspec/rails'

require 'capybara/rspec'
require 'capybara/rails'

describe LinksController, :type => :controller do

  
  def setup
    @user_admin = users(:joe)
    @user_regular = users(:eric)
  end
   
  
  
  describe 'add new link as an admin' do
    
    before :each do
      session[:user_id] = 1
      User.create!(:name => "Joseph Koshakow", :uid => 3, :email => 'jkoshakow@wesleyan.edu', :admin => true)
    end
    
    context 'all fields correct' do
      it 'should validate the url' do
        expect(Link.new(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)).to be_valid
      end
      
      it 'should add a new link' do
        @fake_link = double("Link", :name => "Google", :url => "http://www.googlee.com", :category => "search", :upvotes => 0, :status => false)
        allow(Link).to receive(:create!).and_return(@fake_link)
        session[:admin] = true
        post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes}, :admin => true
        #expect(response).to redirect_to(links_path)
      end
    end
    
    context 'invalid URL' do
      it 'should reject the url' do
        expect(Link.new(:name => "Google", :url => "google", :category => "search", :upvotes => 0)).to_not be_valid
        i = Link.all_categories
        post :create, :link => {:name => "Google", :url => "googlee.com", :category => "search", :upvotes => 0} 
        #expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'empty name' do
      it 'should reject the URL' do
        expect(Link.new(:name => "", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)).to_not be_valid
        post :create, :link => {:name => "", :url => "http://www.googlee.com", :category => "search", :upvotes => 0} 
        #expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'empty url' do
      it 'should reject the URL' do
        expect(Link.new(:name => "google", :url => "", :category => "search", :upvotes=> 0)).to_not be_valid
        post :create, :link => {:name => "Google", :url => "", :category => "search", :upvotes => 0} 
        #expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'not unique URL' do
        it 'should reject the URL' do
          Link.create!(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)
          expect(Link.new(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)).to_not be_valid
          post :create, :link => {:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0} 
          #expect(response).to redirect_to(new_link_path)
      end
    end
  end
  
  
  
  describe 'add new link as a user' do
    
    before :each do
      session[:user_id] = 1
      User.create!(:name => "Joseph Koshakow", :uid => 3, :email => 'jkoshakw@wesleyan.edu', :admin => false)
    end
    
    context 'all fields correct' do
      it 'should validate the url' do
        expect(Link.new(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)).to be_valid
      end
      
      it 'should add a new link' do
        @fake_link = double("Link", :name => "Google", :url => "http://www.google.com", :category => "search", :upvotes => 0, :status => false)
        session[:rspec_test] = true
        allow(Link).to receive(:create!).and_return(@fake_link)
        post :create, :link => {:name => @fake_link.name, :url => @fake_link.url, :category => @fake_link.category, :upvotes => @fake_link.upvotes} 
        #expect(response).to redirect_to(links_path)
      end
    end
    
    
    context 'invalid URL' do
      it 'should reject the url' do
        expect(Link.new(:name => "Google", :url => "google", :category => "search", :upvotes => 0)).to_not be_valid
        post :create, :link => {:name => "Google", :url => "google.com", :category => "search", :upvotes => 0} 
        #expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'empty name' do
      it 'should reject the URL' do
        expect(Link.new(:name => "", :url => "http://www.google.com", :category => "search", :upvotes => 0)).to_not be_valid
        post :create, :link => {:name => "", :url => "http://www.google.com", :category => "search", :upvotes => 0} 
        #expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'empty url' do
      it 'should reject the URL' do
        expect(Link.new(:name => "google", :url => "", :category => "search", :upvotes=> 0)).to_not be_valid
        post :create, :link => {:name => "Google", :url => "", :category => "search", :upvotes => 0} 
        #expect(response).to redirect_to(new_link_path)
      end
    end
    
    context 'not unique URL' do
        it 'should reject the URL' do
          Link.create!(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)
          expect(Link.new(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)).to_not be_valid
          post :create, :link => {:name => "Google", :url => "http://www.googlee.com", :category => "search", :upvotes => 0} 
          #expect(response).to redirect_to(new_link_path)
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
      Link.create!(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)
      get :show, :id => 1
    end
  end
  
  describe 'new, unlogged in' do
    it 'should show the new page' do
      session[:authenticated] = false
      get :new
      expect(response).to redirect_to(root_path)
    end
  end
  
  describe 'new, logged in' do
    it 'should show the new page' do
      session[:authenticated] = true
      get :new
    end
  end
  
  describe 'edit' do
    it 'should show the edit page' do
      Link.create!(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)
      get :edit, :id => 1
    end
  end
  
  describe 'update' do
    it 'should go to the update page' do
      Link.create!(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)
      get :update, :id => 1
    end
  end
  
  describe 'destroy' do
    it 'should destroy a link' do
      session[:rspec_test] = true
      Link.create!(:name => "Googlee", :url => "http://www.googlee.com", :category => "search", :upvotes => 0)
      get :destroy, :id => 1
    end
  end
  
  describe 'approve_link' do
    it 'should load approve_link' do
      get :approve_link
    end
  end
  
  describe 'approve_or_decline' do
    before :each do
      # params[:link_id] = 1
      Link.create!(:url => "http://www.googlee.com", :name => 'Googlee', :email => 'jkoshakow@wesleyan.edu', :category => 'Jobs', :status => false)
    end
    
    context 'approve link' do
      it 'should approve the link' do
        post :approve_or_decline, :link_id => 1, :commit => "Approve", format: :js
      end
    end
    
    context 'decline link' do
      it 'should decline the link' do
        post :approve_or_decline, :link_id => 1, :commit => "Decline", format: :js 
      end
    end
    
  end
  
  describe 'upvote, no user_id' do
    it 'should add an upvote' do
      Link.create!(:url => "http://www.googlee.com", :name => 'Googlee', :email => 'jkoshakow@wesleyan.edu', :category => 'Jobs', :status => false, :upvotes => 0, :upvoters => "jkoshakow@wesleyan.edu; koshy44@gmail.com")
      put :upvote, :id => 2, format: :js
    end
  end
  
  describe 'upvote, no user_id' do
    it 'should add an upvote' do
      Link.create!(:url => "http://www.googlee.com", :name => 'Googlee', :email => 'jkoshakow@wesleyan.edu', :category => 'Jobs', :status => false, :upvotes => 0, :upvoters => "jkoshakow@wesleyan.edu; koshy44@gmail.com")
      put :upvote, :id => 2, :user_id => 'jkoshakow@wesleyan.edu', format: :js
    end
  end
  
  describe 'report' do
    it 'should report' do
      Link.create!(:url => "http://www.googlee.com", :name => 'Googlee', :email => 'jkoshakow@wesleyan.edu', :category => 'Jobs', :status => true)
      get :report, :id => 1
    end
  end
  
  describe 'reportsend' do
    before :each do
      Link.create!(:url => "http://www.googlee.com", :name => 'Googlee', :email => 'jkoshakow@wesleyan.edu', :category => 'Jobs', :status => true)
    end
    
    context 'report reason: other' do
      it 'should deliver report' do
        put :reportsend, :link_id => 2, :reportreason => "Other", :otherreportreason => "Stuff"
      end
    end
    
    context 'report reason: not other' do
      it 'should deliver report' do
        put :reportsend, :link_id => 1, :reportname => 'Googlee', :reportreason => "reasons"
      end
    end
  end
  
  describe 'remove' do 
    it 'should remove a link' do
      Link.create!(:url => "http://www.googlee.com", :name => 'Googlee', :email => 'jkoshakow@wesleyan.edu', :category => 'Jobs', :status => true)
      put :remove, :id => 2, format: :js
    end
  end
  
  describe 'page' do
    it 'should render a partial' do
      get :page, :aincre => 1, format: :js  
    end
  end
  
end


describe UsersController, :type => :controller do
  
  describe 'create valid email' do
    it 'should create a new user' do 
      # @fake_user = double("User", :name => "Joseph Koshakow", :uid => 3, :email => 'jkoshakow@wesleyan.edu', :admin => false)
      # allow(User).to receive(:create!).and_return(@fake_user)
      # request = [:env => ["omniauth.auth" => [:info => [:email => "jkoshakow@wesleyan.edu"]]]]
      session[:temp] = true
      User.create!(:name => "Joseph Koshakow", :uid => 3, :email => 'jkoshakow@wesleyan.edu', :admin => false)
      post :create, :name => "Joseph Koshakow", :email => 'jkoshakow@wesleyan.edu', :admin => false
    end
  end
  
  
  describe 'create invalid email' do
    it 'should not create a new user' do
       session[:temp] = false
       User.create!(:name => "Joseph Koshakow", :uid => 3, :email => 'koshy44@gmail.com', :admin => false)
       post :create, :name => "Joseph Koshakow", :email => 'koshy@gmail.com', :admin => false
    end
  end
  
  describe 'new admin' do
    context 'user exists' do
      it 'should promote a new admin' do
        User.create!(:name => "Joseph Koshakow", :uid => 3, :email => 'jkoskow@wesleyan.edu', :admin => false)
        put :new_admin, :email => "jkoskow@wesleyan.edu"
      end
    end
    
    context 'user doesn\'t exist' do
      it 'should not promote a new admin' do
        put :new_admin, :email => "jkoshakow@wesleyan.edu"
      end
    end
  end
  
  describe 'index' do
    it 'should go to index' do
      get :index
    end
  end
  
  describe 'destroy' do
    it 'should destroy a user' do
      User.create!(:name => "Joseph Koshakow", :uid => 3, :email => 'jkoshakow@wesleyan.edu', :admin => false)
      Link.create!(:url => "http://www.googlee.com", :name => 'Googlee', :email => 'jkoshakow@wesleyan.edu', :category => 'Jobs', :status => false, :upvotes => 0)
      get :destroy, :id => 1
    end
  end
  
 
end