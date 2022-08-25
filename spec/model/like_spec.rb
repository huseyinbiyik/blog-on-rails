require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    u = User.new(name: 'Huseyin', photo: 'google.com', bio: 'I was born in 2055', posts_counter: '0')
    p = Post.create(title: 'TestTitle', text: 'TestText', comments_counter: '0', likes_counter: '0', author: u)
    Like.create(author: u, post: p)
    Like.create(author: u, post: p)
  end

  it 'should update likes counter' do
    expect(subject.update_likes_counter).to eq true
    expect(subject.post.likes_counter).to eq 2
  end
end
