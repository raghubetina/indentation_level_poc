require "rails_helper"

RSpec.describe "runs/show", type: :view do
  before(:each) do
    assign(:run, Run.create!(
      title: "Title",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end
