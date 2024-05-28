require 'rails_helper'

RSpec.describe "run_units/show", type: :view do
  before(:each) do
    assign(:run_unit, RunUnit.create!(
      title: "Title",
      description: "Description",
      indentation_level: 2,
      run: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
