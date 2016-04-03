require 'rails_helper'

describe LinksController, :type => :controller do
   
   describe 'add new link' do
    it 'should add a new link' do
      @fake_link = double("Link").as_null_object
      allow(Links).to receive(:create!).and_return(@fake_link)
      post :create, :link => {}
      expect(response).to redirect_to(links_path)
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