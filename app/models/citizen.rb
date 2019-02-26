# == Schema Information
#
# Table name: citizens
#
#  id               :bigint(8)        not null, primary key
#  card_ready       :boolean          default(FALSE)
#  dob              :date
#  first_name       :string
#  gender           :integer
#  image            :string
#  last_name        :string
#  origin_city      :string
#  origin_state     :string
#  origin_street    :string
#  phone            :string
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
  has_many :candidates

  validates :first_name, :last_name, :dob, :gender, :image, :origin_city,
    :origin_state, :origin_street, :residence_city, :residence_state, :phone,
    :residence_street, :signature, presence: true

  validates_length_of :phone, within: 8..14

  validate :eligibility

  after_update :send_sms, if: :card_marked_ready?

  # this is not to be gender insensitive but makes gender identification
  # easier for electoral purposes, @ least in this part of the world
  # for now.
  enum gender: { male: 0, female: 1 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    convert_to_years(dob) if dob
  end

  def eligible?
    return false unless age
    age >= 18
  end

  private

  def eligibility
    unless eligible?
      errors.add(:dob, "Too young to participate in an electoral process")
    end
  end

  def send_sms
    SmsWorker.perform_async(id)
  end

  def card_marked_ready?
    saved_change_to_card_ready? && card_ready?
  end
end
