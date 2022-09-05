# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   describe 'GET #index' do
#     it 'is a HTTP success' do
#       get('/')
#       expect(response).to have_http_status(:ok)
#     end
#     it "renders 'index' template" do
#       get '/'
#       expect(response).to render_template('index')
#     end
#     it 'renders the users list' do
#       get '/'
#       expect(response.body).to include('Here is the list of')
#     end
#   end

#   describe 'GET /users/:id' do
#     it 'is a HTTP success' do
#       get '/users/1'
#       expect(response).to have_http_status(:success)
#     end
#     it 'renders the show template' do
#       get '/users/1'
#       expect(response).to render_template('show')
#     end
#     it 'renders the Post text' do
#       get '/users/1'
#       expect(response.body).to include('Show user profile')
#     end
#   end
# end
