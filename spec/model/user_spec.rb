require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Huseyin', photo: 'google.com', bio: 'I was born in 2055', posts_counter: '5') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
