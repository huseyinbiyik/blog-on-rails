require 'rails_helper'

RSpec.describe 'Users/show page', type: :system do
  before do
    @user1 = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
  end

  it 'show the profile picture of  the user' do
    visit "/users/#{@user1.id}"
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end

  it 'shows the username of the user' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.name)
  end

  it 'shows number of posts, post counter' do
    Post.create(title: 'Hello', text: 'This is my first post', author: @user1)
    Post.create(title: 'Hello2', text: 'This is my second post', author: @user1)
    visit "/users/#{@user1.id}"
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
  end

  it 'shows user\'s bio ' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.bio)
  end

  it 'shows three recent posts' do
    first_post = Post.create(title: 'Hello', text: 'This is my first post', author: @user1)
    second_post = Post.create(title: 'Hello2', text: 'This is my second post', author: @user1)
    third_post = Post.create(title: 'Hello3', text: 'This is my third post', author: @user1)
    fourth_post = Post.create(title: 'Hello3', text: 'This is my third post', author: @user1)
    visit "/users/#{@user1.id}"
    expect(page).to have_content(second_post.text)
    expect(page).to have_content(third_post.text)
    expect(page).to have_content(fourth_post.text)
    expect(page).not_to have_content(first_post.text)
  end

  it 'directs you the users profile page' do
    visit "/users/#{@user1.id}"
    click_link 'See All Posts'
    expect(page).to have_current_path("/users/#{@user1.id}/posts")
  end

  it 'redirects me to that post\'s show page' do
    first_post = Post.create(title: 'Hello', text: 'This is my first post', author: @user1)

    visit "/users/#{@user1.id}"
    click_on first_post.title
    expect(page).to have_current_path("/users/#{@user1.id}/posts/#{first_post.id}")
  end
end
