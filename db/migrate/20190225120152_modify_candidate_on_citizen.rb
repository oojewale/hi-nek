class ModifyCandidateOnCitizen < ActiveRecord::Migration[5.1]
  def change
    remove_column :citizens, :contesting
    add_reference :citizens, :candidate, index: true
  end
end
