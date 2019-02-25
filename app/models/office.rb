# == Schema Information
#
# Table name: offices
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Office < ApplicationRecord
  has_many :candidates

  validates :name, presence: true
end
