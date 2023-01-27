class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  def increment_likes
    self.likes += 1
    save
  end
end
