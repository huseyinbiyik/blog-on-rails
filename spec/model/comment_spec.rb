require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    u = User.new(name: 'Huseyin', photo: 'google.com', bio: 'I was born in 2055', posts_counter: '0')
    p = Post.create(title: 'TestTitle', text: 'TestText', comments_counter: '0', likes_counter: '0', author: u)
    Comment.create(text: 'First comment', author: u, post: p)
    Comment.create(text: 'Second comment', author: u, post: p)
  end

  it 'should update comments counter' do
    expect(subject.update_comments_counter).to eq true
    expect(subject.post.comments_counter).to eq 2
  end
end
