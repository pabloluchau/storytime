class CreateStoryParts < ActiveRecord::Migration[6.0]
  def change
    create_table :story_parts do |t|
      t.string :body
      t.integer :story_id
      t.integer :user_id
      t.integer :close_votes_count

      t.timestamps
    end
  end
end
