require 'rails_helper'

RSpec.describe "citizens/edit", type: :view do
  before(:each) do
    @citizen = assign(:citizen, Citizen.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :age => 1,
      :gender => 1,
      :origin_state => "MyString",
      :origin_city => "MyString",
      :origin_street => "MyString",
      :residence_state => "MyString",
      :residence_city => "MyString",
      :residence_street => "MyString",
      :contesting => false,
      :image => "MyString",
      :signature => "MyString",
      :card_ready => false
    ))
  end

  it "renders the edit citizen form" do
    render

    assert_select "form[action=?][method=?]", citizen_path(@citizen), "post" do

      assert_select "input[name=?]", "citizen[first_name]"

      assert_select "input[name=?]", "citizen[last_name]"

      assert_select "input[name=?]", "citizen[age]"

      assert_select "input[name=?]", "citizen[gender]"

      assert_select "input[name=?]", "citizen[origin_state]"

      assert_select "input[name=?]", "citizen[origin_city]"

      assert_select "input[name=?]", "citizen[origin_street]"

      assert_select "input[name=?]", "citizen[residence_state]"

      assert_select "input[name=?]", "citizen[residence_city]"

      assert_select "input[name=?]", "citizen[residence_street]"

      assert_select "input[name=?]", "citizen[contesting]"

      assert_select "input[name=?]", "citizen[image]"

      assert_select "input[name=?]", "citizen[signature]"

      assert_select "input[name=?]", "citizen[card_ready]"
    end
  end
end
