class AddCitizenReferenceToCandidate < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :citizen, index: true
  end
end
