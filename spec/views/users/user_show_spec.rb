require 'rails_helper'

RSpec.describe 'User Page show', type: :feature do
  before :each do
    @user = User.create(
      name: 'Tommy',
      photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
      bio: 'Teacher',
      PostCounter: 3
    )
    @post1 = Post.create(title: 'Hello',
      text: 'My world',
      CommentsCounter: 0,
      LikesCounter: 0,
      author_id: @user.id
    )
    @post2 = Post.create(title: 'Hi',
      text: 'My earth',
      CommentsCounter: 0,
      LikesCounter: 0,
      author_id: @user.id
    )
    @post3 = Post.create(title: 'Hey',
      text: 'My universe',
      CommentsCounter: 0,
      LikesCounter: 0,
      author_id: @user.id
    )
    visit user_path(@user.id)
  end

  it 'shows the profile picture of the user' do
    assert page.has_xpath?("//img[@src = 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80'
     and @alt='user photo']")
  end

  it 'shows the username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows number of posts written by user' do
    expect(page.body).to have_content(@user.PostCounter.to_s)
  end

  it 'shows users bio' do
    expect(page).to have_content('Teacher')
  end

  it 'shows last three posts of user' do
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'shows button for seeing all posts' do
    expect(page).to have_link('See all posts')
  end

  it 'redirects to post show page upon click' do
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end

  # it "When I click to see all posts button, it should redirects me to the user's post's index page" do
  #   click_link('See all posts')
  #   expect(page).to have_current_path(user_posts_path(@user))
  # end
end
