class CreateCloseVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :close_votes do |t|
      t.integer :story_id
      t.integer :user_id

      t.timestamps
    end
  end
end
