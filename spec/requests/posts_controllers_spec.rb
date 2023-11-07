# spec/requests/posts_controller_spec.rb

require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe "GET #index" do
    it "returns a successful response" do
      get user_posts_path(745) # Replace with the actual user ID
      expect(response).to have_http_status(:success)
    end

    it "renders the 'index' template" do
      get user_posts_path(745) # Replace with the actual user ID
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get user_post_path(745, 3) # Replace with the actual user and post IDs
      expect(response).to have_http_status(:success)
    end

    it "renders the 'show' template" do
      get user_post_path(745, 3) # Replace with the actual user and post IDs
      expect(response).to render_template("show")
    end
  end
end
