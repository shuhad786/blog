require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many :posts }
    it { should have_many :likes }
    it { should have_many :comments }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:PostCounter) }
  end
end
