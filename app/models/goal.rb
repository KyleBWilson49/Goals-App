# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :string           not null
#  user_id    :integer          not null
#  completed  :boolean          default(FALSE)
#  public     :boolean          default(TRUE)
#  goal_date  :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base
  validates :title, :body, :user_id, :goal_date, presence: true

  belongs_to :user

  has_many :comments, class_name: "GoalComment"
end
