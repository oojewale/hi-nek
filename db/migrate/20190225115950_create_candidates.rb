class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.references :party, foreign_key: true
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
