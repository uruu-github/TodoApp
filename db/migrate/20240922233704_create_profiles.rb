class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.text :introduction
      t.integer :gender
      t.date :birthday
      t.timestamps
    end
  end
end
