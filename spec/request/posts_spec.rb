require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before do
      @first_user = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
      @first_post = Post.create(author: @first_user, title: 'My first championship', text: "Mercedes Team Principal Toto Wolff has defended.\n")
    end
    it 'is a HTTP success' do
      get("/users/#{@first_user.id}/posts")
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      get("/users/#{@first_user.id}/posts")
      expect(response).to render_template('index')
    end
    it 'renders the posts as list' do
      get("/users/#{@first_user.id}/posts")
      expect(response.body).to include(@first_post.text)
    end
  end

  describe 'GET /users/:id/posts/:id' do
    before do
      @first_user = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
      @first_post = Post.create(author: @first_user, title: 'My first championship', text: "Mercedes Team Principal Toto Wolff has defended.\n")
    end
    it 'is a HTTP success' do
      get("/users/#{@first_user.id}/posts/#{@first_post.id}")
      expect(response).to have_http_status(:success)
    end
    it 'renders the show template' do
      get("/users/#{@first_user.id}/posts/#{@first_post.id}")
      expect(response).to render_template('show')
    end
    it 'renders the the post of specific user' do
      get("/users/#{@first_user.id}/posts/#{@first_post.id}")
      expect(response.body).to include(@first_post.text)
    end
  end
end
