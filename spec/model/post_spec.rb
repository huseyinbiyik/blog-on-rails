require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'TestTitle', text: 'TestText', comments_counter: '0', likes_counter: '5') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title shoud be maximum 250 character' do
    subject.title = 'A text more than 250 character. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pret'
    expect(subject).to_not be_valid
  end
end
