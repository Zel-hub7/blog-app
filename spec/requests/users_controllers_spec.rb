# spec/requests/users_controller_spec.rb

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it "renders the 'index' template" do
      get users_path
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('User Name')
      expect(response.body).to include('Number of posts x')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get user_path(745)
      expect(response).to have_http_status(:success)
    end

    it "renders the 'show' template" do
      get user_path(745)
      expect(response).to render_template('show')
    end

    it 'includes correct placeholder text in the response body' do
      get user_path(745)
      expect(response.body).to include('User name')
      expect(response.body).to include('Number of posts: x')
      expect(response.body).to include('Bio')
      expect(response.body).to include('Lorem..............')
      expect(response.body).to include('Post #1')
      expect(response.body).to include('Lorem...................')
      expect(response.body).to include('Post #2')
      expect(response.body).to include('Lorem...................')
      expect(response.body).to include('Post #3')
      expect(response.body).to include('Lorem...................')
    end
  end
end
