class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :user
      t.string :references
      t.string :post

      t.timestamps
    end
  end
end
