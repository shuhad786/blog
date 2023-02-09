class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :PostCounter, numericality: { greater_than_or_equal_to: 0 }

  def find_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
