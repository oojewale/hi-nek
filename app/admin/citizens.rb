ActiveAdmin.register Citizen do
  permit_params :card_ready

  index do
    id_column
    column :email
    column :card_ready
    column :dob
    column :first_name
    column :last_name
    column :gender
    column :origin_state
    column :residence_state
    actions
  end

  filter :email

  show do
    attributes_table :card_ready, :dob, :full_name, :gender, :phone,
      :origin_city, :origin_state, :origin_street, :residence_city,
      :residence_state, :residence_street do
        row 'Email' do
          resource.user.email
        end
      end
  end

  form do |f|
    f.inputs do
      f.input :card_ready
    end
    f.actions
  end
end
