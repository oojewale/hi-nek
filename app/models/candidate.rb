# == Schema Information
#
# Table name: candidates
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  citizen_id :bigint(8)
#  office_id  :bigint(8)
#  party_id   :bigint(8)
#
# Indexes
#
#  index_candidates_on_citizen_id  (citizen_id)
#  index_candidates_on_office_id   (office_id)
#  index_candidates_on_party_id    (party_id)
#
# Foreign Keys
#
#  fk_rails_...  (office_id => offices.id)
#  fk_rails_...  (party_id => parties.id)
#

class Candidate < ApplicationRecord
  belongs_to :party
  belongs_to :office
  belongs_to :citizen

  validates_uniqueness_of :party_id, scope: :office_id,
    message: "You can only register for 1 office with a party once for an election."
end
