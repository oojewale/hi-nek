require 'rails_helper'

RSpec.describe "citizens/show", type: :view do
  before(:each) do
    @citizen = assign(:citizen, Citizen.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :age => 2,
      :gender => 3,
      :origin_state => "Origin State",
      :origin_city => "Origin City",
      :origin_street => "Origin Street",
      :residence_state => "Residence State",
      :residence_city => "Residence City",
      :residence_street => "Residence Street",
      :contesting => false,
      :image => "Image",
      :signature => "Signature",
      :card_ready => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Origin State/)
    expect(rendered).to match(/Origin City/)
    expect(rendered).to match(/Origin Street/)
    expect(rendered).to match(/Residence State/)
    expect(rendered).to match(/Residence City/)
    expect(rendered).to match(/Residence Street/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Signature/)
    expect(rendered).to match(/false/)
  end
end
