class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :voteable_id
      t.string :voteable_type
      t.references :voter

      t.timestamps(null: false)
    end

      add_index :votes, [:voter_id, :voteable_id, :voteable_type], unique: true
  end
end
