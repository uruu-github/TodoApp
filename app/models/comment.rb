# == Schema Information
#
# Table name: comments
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  task_id     :bigint           not null
#
# Indexes
#
#  index_comments_on_task_id  (task_id)
#
class Comment < ApplicationRecord
  belongs_to :task
end
