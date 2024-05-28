require "rails_helper"

RSpec.describe "run_units/index", type: :view do
  before(:each) do
    assign(:run_units, [
      RunUnit.create!(
        title: "Title",
        description: "Description",
        indentation_level: 2,
        run: nil
      ),
      RunUnit.create!(
        title: "Title",
        description: "Description",
        indentation_level: 2,
        run: nil
      )
    ])
  end

  it "renders a list of run_units" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
