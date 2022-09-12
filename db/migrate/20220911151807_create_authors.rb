class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name, null: false, default: ""
      t.string :address, null: false, default: ""

      t.timestamps
    end
    add_index :authors, [:address], unique: true
  end
end
