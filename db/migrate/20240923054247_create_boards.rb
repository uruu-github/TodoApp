class CreateBoards < ActiveRecord::Migration[7.2]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
