require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'TestTitle', text: 'TestText', comments_counter: '0', likes_counter: '5') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end
