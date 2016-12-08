class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :author_id, foreign_key: true
      t.text :body
      t.text :title

      t.timestamps
    end
  end
end
