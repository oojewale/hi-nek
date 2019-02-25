require 'rails_helper'

RSpec.describe "candidates/edit", type: :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!(
      :party => nil,
      :office => nil
    ))
  end

  it "renders the edit candidate form" do
    render

    assert_select "form[action=?][method=?]", candidate_path(@candidate), "post" do

      assert_select "input[name=?]", "candidate[party_id]"

      assert_select "input[name=?]", "candidate[office_id]"
    end
  end
end
