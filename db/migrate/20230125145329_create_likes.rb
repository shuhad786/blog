class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :user
      t.string :references
      t.string :post

      t.timestamps
    end
  end
end
