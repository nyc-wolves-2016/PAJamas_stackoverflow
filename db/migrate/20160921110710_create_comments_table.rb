class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :commenter
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps(null: false)
    end

    # add_index :comments, [:commenter_id, :commentable_id, :commentable_type]
  end
end
