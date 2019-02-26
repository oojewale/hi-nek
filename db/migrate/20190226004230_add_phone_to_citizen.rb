class AddPhoneToCitizen < ActiveRecord::Migration[5.1]
  def change
    add_column :citizens, :phone, :string
  end
end
