require 'rails_helper'

RSpec.describe "candidates/new", type: :view do
  before(:each) do
    assign(:candidate, Candidate.new(
      :party => nil,
      :office => nil
    ))
  end

  it "renders new candidate form" do
    render

    assert_select "form[action=?][method=?]", candidates_path, "post" do

      assert_select "input[name=?]", "candidate[party_id]"

      assert_select "input[name=?]", "candidate[office_id]"
    end
  end
end
