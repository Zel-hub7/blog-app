# spec/requests/posts_controller_spec.rb

require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get user_posts_path(745) # Replace with the actual user ID
      expect(response).to have_http_status(:success)
    end

    it "renders the 'index' template" do
      get user_posts_path(745) # Replace with the actual user ID
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(745) # Replace with the actual user ID
      expect(response.body).to include('User name')
      expect(response.body).to include('Number of posts: x')
      expect(response.body).to include('Post #1')
      expect(response.body).to include('Lorem ....')
      expect(response.body).to include('Username: Comment 1')
      expect(response.body).to include('Username: Comment 2')
      expect(response.body).to include('Username: Comment 3')
      expect(response.body).to include('Username: Comment 4')
      expect(response.body).to include('Username: Comment 5')
      expect(response.body).to include('Post #2')
      expect(response.body).to include('Lorem ipsum....')
      expect(response.body).to include('Username: Comment 1')
      expect(response.body).to include('Username: Comment 2')
      expect(response.body).to include('Username: Comment 3')
      expect(response.body).to include('Username: Comment 4')
      expect(response.body).to include('Username: Comment 5')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get user_post_path(745, 3) # Replace with the actual user and post IDs
      expect(response).to have_http_status(:success)
    end

    it "renders the 'show' template" do
      get user_post_path(745, 3) # Replace with the actual user and post IDs
      expect(response).to render_template('show')
    end

    it 'includes correct placeholder text in the response body' do
      get user_post_path(745, 3) # Replace with the actual user and post IDs
      expect(response.body).to include('Post #1 by username')
      expect(response.body).to include('Lorem ....')
      expect(response.body).to include('Username: Comment 1')
      expect(response.body).to include('Username: Comment 2')
      expect(response.body).to include('Username: Comment 3')
      expect(response.body).to include('Username: Comment 4')
      expect(response.body).to include('Username: Comment 5')
    end
  end
end
