class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commenter_id, foreign_key: true
      t.integer :commentable_id
      t.string :commentable_type
      t.timestamps
    end
  end
end
