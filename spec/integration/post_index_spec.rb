# spec/integration/post_index_spec.rb

require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  describe 'Post index page' do
    before :each do
      @user = User.create(name: 'Bunny', photo: 'https://somewhere.com/an_ordinary_photo.jpg',
        bio: 'Anyone in this world', posts_counter: 0)
      @user.save
      @post = Post.create(author: @user, title: 'Nonsense', text: 'This guy should stop spitting bullshit')
      @post.save
    end

    it 'should render the profile picture of the user' do
      visit user_posts_path(user_id: @user.id)
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
   
  end
end
