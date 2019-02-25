require 'rails_helper'

RSpec.describe "candidates/show", type: :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!(
      :party => nil,
      :office => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
