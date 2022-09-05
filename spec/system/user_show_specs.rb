require 'rails_helper'

RSpec.describe 'Users/show page', type: :system do
  before do
    @user1 = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
  end

  it 'show the profile picture of  the user' do
    visit "/users/#{@user1.id}"
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end
end
