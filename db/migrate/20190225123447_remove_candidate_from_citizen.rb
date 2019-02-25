class RemoveCandidateFromCitizen < ActiveRecord::Migration[5.1]
  def change
    remove_reference :citizens, :candidate, index: true
  end
end
