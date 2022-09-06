require 'rails_helper'
​
RSpec.describe 'Users/posts/id page', type: :system do
  before do
    @user1 = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
    @user2 = User.create(name: 'Verstappen', photo: 'https://www.formula1.com/content/fom-website/en/drivers/max-verstappen/_jcr_content/image.img.640.medium.jpg/1646819045507.jpg', bio: 'Driver from Netherlands.')
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', author: @user1)
    @second_post = Post.create(title: 'Hello2', text: 'This is my second post', author: @user1)
    @first_comment = Comment.create(author: @user1, post: @first_post, text: 'First Comment')
    @second_comment = Comment.create(author: @user2, post: @first_post, text: 'Second Comment')
  end
​
  it 'shows post\'s title' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.title)
  end
​
  it 'shows who wrote the post' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.author.name)
  end
​
  it 'shows how many comments made on a post, comments_counter' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end
​
  it 'shows how many likes made on a post, likes_counter' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content("Comments: #{@first_post.likes_counter}")
  end
​
  it 'shows post\'s body' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.text)
    expect(page).not_to have_content('michael schumaer')
  end
​
  it 'shows commentator\s name' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_comment.author.name)
    expect(page).not_to have_content('Michael')
  end
​
  it 'shows each commentator\s each comment' do
    visit "/users/#{@user1.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_comment.text)
    expect(page).to have_content(@second_comment.text)
    expect(page).not_to have_content('Michael')
  end
end
