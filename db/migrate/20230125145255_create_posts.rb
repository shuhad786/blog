class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :string
      t.string :text
      t.string :CommentsCounter
      t.string :integer
      t.string :user
      t.string :references

      t.timestamps
    end
  end
end
