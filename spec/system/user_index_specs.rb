require 'rails_helper'

RSpec.describe 'User/index page', type: :system do
  before do
    @user1 = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
    @user2 = User.create(name: 'Verstappen', photo: 'https://www.formula1.com/content/fom-website/en/drivers/max-verstappen/_jcr_content/image.img.640.medium.jpg/1646819045507.jpg', bio: 'Driver from Netherlands.')
  end

  it 'shows the username of all other users' do
    visit '/'
    expect(page).to have_content(@user1.name)
  end

  it 'show the profile picture of each user' do
    visit '/'
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end

  it 'shows number of posts, post counter' do
    Post.create(title: 'Hello', text: 'This is my first post', author: @user1)
    Post.create(title: 'Hello2', text: 'This is my second post', author: @user1)
    visit '/'
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
  end

  it 'directs you the users profile page' do
    @user3 = User.create(name: 'Leclerc', photo: 'https://www.formula1.com/content/fom-website/en/drivers/charles-leclerc/_jcr_content/image.img.1920.medium.jpg/1646818893219.jpg', bio: 'Driver from Monaco.')
    visit '/'
    click_on @user3.name
    expect(page).to have_current_path("/users/#{@user3.id}")
  end
end
