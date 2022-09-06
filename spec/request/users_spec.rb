require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before do
      @first_user = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
    end
    it 'is a HTTP success' do
      get('/')
      expect(response).to have_http_status(:success)
    end
    it "renders 'index' template" do
      get '/'
      expect(response).to render_template('index')
    end
    it 'renders the users list' do
      get '/'
      expect(response.body).to include(@first_user.name)
    end
  end

  describe 'GET /users/:user_id' do
    before do
      @first_user = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
      @first_post = Post.create(author: @first_user, title: 'My first championship', text: "Mercedes Team Principal Toto Wolff has defended.\n")
    end
    it 'is a HTTP success' do
      get "/users/#{@first_user.id}"
      expect(response).to have_http_status(:success)
    end
    it 'renders the show template' do
      get "/users/#{@first_user.id}"
      expect(response).to render_template('show')
    end
    it 'renders the Post text' do
      get "/users/#{@first_user.id}"
      expect(response.body).to include(@first_post.text)
    end
  end
end
