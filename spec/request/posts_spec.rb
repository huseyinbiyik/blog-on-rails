require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'is a HTTP success' do
      get('/users/1/posts')
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end
    it 'renders the users list' do
      get '/users/1/posts'
      expect(response.body).to include('List all posts of the specific user')
    end
  end
end
