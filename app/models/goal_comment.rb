# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  goal_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GoalComment < ActiveRecord::Base
  validates :body, :author_id, :goal_id, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: "User"

  belongs_to :goal
end
