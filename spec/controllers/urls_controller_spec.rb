require 'spec_helper'

describe UrlsController, :type => :controller do
  
    describe 'GET #popular' do
    it "returns an array of popular meetings" do
      get :popular
      expect((assigns :urls).length).to eq(100)
    end

    it "renders the :popular template" do
      get :popular
      expect(response).to render_template :popular
    end
  end
end