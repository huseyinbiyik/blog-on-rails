require 'rails_helper'
​
RSpec.describe 'Users/posts/ page', type: :system do
  before do
    @user1 = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', author: @user1)
    @second_post = Post.create(title: 'Hello2', text: 'This is my second post', author: @user1)
  end
​
  it 'show the profile picture of  the user' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end
​
  it 'shows the username of the user' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content(@user1.name)
  end
​
  it 'shows number of posts, post counter' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
  end
​
  it 'shows post\'s title' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content(@first_post.title)
  end
​
  it 'shows post\'s body' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content(@first_post.text)
    expect(page).to have_content(@second_post.text)
    expect(page).not_to have_content('michael')
  end
​
  it 'shows post\'s first comment' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content(@first_post.text)
  end
​
  it 'shows how many likes a post, likes_counter' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end
​
  it 'shows pagination button' do
    visit "/users/#{@user1.id}/posts"
    expect(page).to have_content('Pagination')
  end
​
  it 'redirects me to that post\'s show page' do
    visit "/users/#{@user1.id}/posts"
    click_on @first_post.title
    expect(page).to have_current_path("/users/#{@user1.id}/posts/#{@first_post.id}")
  end
end
