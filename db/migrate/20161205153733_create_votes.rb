class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :voter_id, foreign_key: true
      t.integer :voteable_id
      t.string :voteable_type
      t.integer :vote_direction, default: 0
      t.timestamps
    end
  end
end
