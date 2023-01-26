class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def update_comments_counter
    self.update(comments_count: self.comments.count)
  end
end
