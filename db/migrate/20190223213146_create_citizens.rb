class CreateCitizens < ActiveRecord::Migration[5.1]
  def change
    create_table :citizens do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.date :dob
      t.integer :gender
      t.string :origin_state
      t.string :origin_city
      t.string :origin_street
      t.string :residence_state
      t.string :residence_city
      t.string :residence_street
      t.boolean :contesting, default: false
      t.boolean :card_ready, default: false
      t.string :image
      t.string :signature

      t.timestamps
    end
  end
end
