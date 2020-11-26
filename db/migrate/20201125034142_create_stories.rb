class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :body
      t.integer :user_id
      t.string :filter
      t.integer :likes_count

      t.timestamps
    end
  end
end
