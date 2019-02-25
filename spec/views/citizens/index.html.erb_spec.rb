require 'rails_helper'

RSpec.describe "citizens/index", type: :view do
  before(:each) do
    assign(:citizens, [
      Citizen.create!(
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
      ),
      Citizen.create!(
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
      )
    ])
  end

  it "renders a list of citizens" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Origin State".to_s, :count => 2
    assert_select "tr>td", :text => "Origin City".to_s, :count => 2
    assert_select "tr>td", :text => "Origin Street".to_s, :count => 2
    assert_select "tr>td", :text => "Residence State".to_s, :count => 2
    assert_select "tr>td", :text => "Residence City".to_s, :count => 2
    assert_select "tr>td", :text => "Residence Street".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Signature".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
