require 'rails_helper'
require 'rails-controller-testing'
Rails::Controller::Testing.install

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get users_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:user) do
      User.create(
        name: 'shuhad',
        photo: 'https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        bio: 'Teacher',
        PostCounter: 0
      )
    end

    it 'returns a successful response' do
      get "/users/#{user.id}"
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
  end
end
