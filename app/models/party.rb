# == Schema Information
#
# Table name: parties
#
#  id         :bigint(8)        not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Party < ApplicationRecord
  has_many :candidates

  validates_length_of :code, is: 3,
    wrong_length: "must be %{count} characters long."
end
