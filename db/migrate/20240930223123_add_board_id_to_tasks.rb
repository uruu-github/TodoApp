class AddBoardIdToTasks < ActiveRecord::Migration[7.2]
  def change
    add_reference :tasks, :board
  end
end
