require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    u = User.new(name: 'Huseyin', photo: 'google.com', bio: 'I was born in 2055', posts_counter: '0')
    Post.create(title: 'TestTitle', text: 'TestText', comments_counter: '0', likes_counter: '0', author: u)
    Post.create(title: 'TestTitle', text: 'TestText', comments_counter: '0', likes_counter: '0', author: u)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title shoud be maximum 250 character' do
    subject.title = 'A text more than 250 character. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pret'
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater than 0' do
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'comments counter should be equal to 0' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end

  it 'likes counter should be greater than 0' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'likes counter should be equal to 0' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end

  it 'should update post counter' do
    expect(subject.update_posts_counter).to eq true
    expect(subject.author.posts_counter).to eq 2
  end
end
