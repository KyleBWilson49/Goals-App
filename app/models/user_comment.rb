# == Schema Information
#
# Table name: user_comments
#
#  id           :integer          not null, primary key
#  body         :string           not null
#  author_id    :integer          not null
#  commentee_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class UserComment < ActiveRecord::Base
  validates :body, :author_id, :commentee_id, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: "User"

  belongs_to :commentee,
    foreign_key: :commentee_id,
    class_name: "User"
end
