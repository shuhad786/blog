require 'rails_helper'
require 'rails-controller-testing'
Rails::Controller::Testing.install

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    before :each do
      @user = User.create(name: 'Tom',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher',
                          PostCounter: 1)
    end
    it 'returns a successful response' do
      get "/users/#{@user.id}/posts"
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get "/users/#{@user.id}/posts"
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before :each do
      @user = User.create(name: 'Tom',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher',
                          PostCounter: 1)
      @post = Post.create(title: 'Hi',
                          text: 'My world',
                          CommentsCounter: 0,
                          LikesCounter: 1,
                          author_id: 1)
      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'returns a successful response' do
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
