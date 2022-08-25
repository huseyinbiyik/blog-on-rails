require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Huseyin', photo: 'google.com', bio: 'I was born in 2055', posts_counter: '5') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be greater than 0' do
    subject.posts_counter = -5
    expect(subject).to_not be_valid
  end

  it 'posts counter should be equal to 0' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'should list three recent posts' do
    4.times do |i|
      Post.create(title: 'Hello', text: "This is my #{i}th post", comments_counter: 0, likes_counter: 0,
                  author: subject)
    end

    expect(subject.three_recent_posts[0].text).to eq 'This is my 3th post'
    expect(subject.three_recent_posts.length).to eq 3
  end
end
