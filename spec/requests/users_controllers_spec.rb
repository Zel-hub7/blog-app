# spec/requests/users_controller_spec.rb

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "GET #index" do
    it "returns a successful response" do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it "renders the 'index' template" do
      get users_path
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get user_path(745) # Replace with the actual user ID
      expect(response).to have_http_status(:success)
    end

    it "renders the 'show' template" do
      get user_path(745) # Replace with the actual user ID
      expect(response).to render_template("show")
    end
  end
end
