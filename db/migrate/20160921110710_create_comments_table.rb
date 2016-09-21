class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :author
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps(null: false)
    end
  end
end
