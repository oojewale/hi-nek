# == Schema Information
#
# Table name: citizens
#
#  id               :bigint(8)        not null, primary key
#  card_ready       :boolean          default(FALSE)
#  contesting       :boolean          default(FALSE)
#  dob              :date
#  first_name       :string
#  gender           :integer
#  image            :string
#  last_name        :string
#  origin_city      :string
#  origin_state     :string
#  origin_street    :string
#  residence_city   :string
#  residence_state  :string
#  residence_street :string
#  signature        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#
# Indexes
#
#  index_citizens_on_user_id  (user_id)
#

class Citizen < ApplicationRecord
  include AgeConcern
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :first_name, :last_name, :dob, :gender, :image, :origin_city,
    :origin_state, :origin_street, :residence_city, :residence_state,
    :residence_street, :signature, presence: true


  # this is not to be gender insensitive but makes gender identification
  # easier for electoral purposes @ least in this part of the world
  # for now.
  enum gender: { male: 0, female: 1 }

  def age
    convert_to_years(dob) if dob
  end

  def eligible?
    age >= 18
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
