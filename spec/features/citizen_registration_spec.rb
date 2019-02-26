require 'rails_helper'

RSpec.describe "register new citizen", type: :feature do
  let(:test_image) { Rails.root.join('spec/support/soccer.jpeg') }

  it "registers" do
    visit 'users/sign_up'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'citizen_first_name', with: 'Olaide'
    fill_in 'citizen_last_name', with: 'Ojewale'
    fill_in 'citizen_phone', with: '+2343000023242'
    select '1960', from: 'user_citizen_attributes_dob_1i'
    select 'October', from: 'user_citizen_attributes_dob_2i'
    select '1', from: 'user_citizen_attributes_dob_3i'
    select 'Female', from: 'user_citizen_attributes_gender'
    fill_in 'citizen_origin_state', with: 'origin_state'
    fill_in 'citizen_origin_city', with: 'origin_city'
    fill_in 'citizen_origin_street', with: 'origin_street'
    fill_in 'citizen_residence_state', with: 'residence_state'
    fill_in 'citizen_residence_city', with: 'residence_city'
    fill_in 'citizen_residence_street', with: 'residence_street'
    attach_file('citizen_image', test_image, make_visible: true)
    find("#JohnHancock-hidden", visible: false).set(test_image)

    click_button 'Register'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
