class FixTasksAssociation < ActiveRecord::Migration[7.2]
  def change
    # 外部キー制約なしでboard_idカラムを削除
    remove_reference :tasks, :board

    # 正しいカラムを追加
    add_reference :tasks, :user, null: false, foreign_key: true
  end
end
