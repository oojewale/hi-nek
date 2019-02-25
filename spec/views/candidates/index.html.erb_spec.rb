require 'rails_helper'

RSpec.describe "candidates/index", type: :view do
  before(:each) do
    assign(:candidates, [
      Candidate.create!(
        :party => nil,
        :office => nil
      ),
      Candidate.create!(
        :party => nil,
        :office => nil
      )
    ])
  end

  it "renders a list of candidates" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
