require 'rails_helper'

RSpec.describe 'Post Page Index', type: :feature do
  before :each do
    @user = User.create(
      name: 'Tommy',
      photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
      bio: 'Teacher',
      PostCounter: 3
    )
    @post = Post.create(title: 'Hello',
      text: 'My world',
      CommentsCounter: 0,
      LikesCounter: 0,
      user_id: @user.id,
      author_id: @user.id)
    5.times do
      Comment.create(post: @post,
        author: @user,
        text: 'hello yimi',
        user_id: @user.id,
        post_id: @post.id,
        author_id: @user.id)
    end
    visit user_posts_path(@user.id)
  end

  it 'shows the profile picture of the user' do
    assert page.has_xpath?("//img[@src = 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80'
    and @alt='user photo']")
  end

  it 'shows the username of user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows number of posts of user' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'shows the title of a post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows the body of a post' do
    expect(page).to have_content('My world')
  end

  it 'shows first comments on a post' do
    expect(page).to have_content('hello yimi')
  end

  it 'shows number of comments for a post' do
    expect(page).to have_content('Comments: 5')
  end

  it 'shows number of likes for a post' do
    expect(page).to have_content('Likes: 0')
  end

  it 'shows section for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects to posts show page' do
    click_on 'Hello'
    expect(page).to have_current_path user_post_path(@user.id, @post.id)
  end
end
