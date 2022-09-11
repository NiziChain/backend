class CreateOriginals < ActiveRecord::Migration[7.0]
  def change
    create_table :originals do |t|
      t.belongs_to :author, foreign_key: true, null: false
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""

      t.timestamps
    end
  end
end
