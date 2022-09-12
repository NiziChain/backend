class CreateSecondaries < ActiveRecord::Migration[7.0]
  def change
    create_table :secondaries do |t|
      t.belongs_to :author, foreign_key: true, null: false
      t.belongs_to :original, foreign_key: true, null: false
      t.integer :content_id, null: false, default: 0
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""

      t.timestamps
    end
    add_index :secondaries, [:content_id, :title], unique: true
  end
end
