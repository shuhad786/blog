class Post < ApplicationRecord
  has_many :likes, foreign_key: 'posts_id'
  has_many :comments, foreign_key: 'posts_id'
  belongs_to :author, class_name: 'User', dependent: :destroy, foreign_key: 'author_id'

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_count
    self.update(posts_count: self.posts.count)
  end

  def recent_comments
    self.comments.order(created_at: :desc).limit(5)
  end
end
