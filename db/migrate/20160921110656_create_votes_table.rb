class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :votable_id
      t.string :votable_type
      t.references :user

      t.timestamps (null: false)
    end

      add_index :votes, [:user_id, :voteable_id, :voteable_type], unique: true
  end
end
