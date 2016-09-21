class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body
      t.references :asker

      t.timestamps(null: false)
    end
  end
end
