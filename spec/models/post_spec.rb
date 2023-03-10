require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to :author }
    it { should have_many :likes }
    it { should have_many :comments }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:CommentsCounter) }
    it { should validate_numericality_of(:LikesCounter) }
  end
end
