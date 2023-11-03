# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Using the expected params' do
    it 'expects to be valid with valid name' do
      user = User.new(name: 'Tom')
      user.posts_counter = 0
      expect(user).to be_valid
    end

    it 'should respond to user_recent_posts' do
      user = User.new(name: 'Tom')
      user.posts_counter = 0
      expect(user).to respond_to(:user_recent_posts)
    end
  end

  context 'Using the unexpected values or params' do
    it 'Mr Ariel Should have an invalid posts_counter number <2023.5>' do
      user = User.new(name: 'Tom')
      user.posts_counter = 2023.5
      expect(user).to be_invalid
    end

    it "expects not to be valid without a user's name" do
      user = User.new
      expect(user).not_to be_valid
    end

    it 'expects not to be valid with a negative post_counter' do
      user = User.new(name: 'Tom')
      user.posts_counter = -2023
      expect(user).to be_invalid
    end
  end
end