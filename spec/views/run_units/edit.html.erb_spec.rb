require "rails_helper"

RSpec.describe "run_units/edit", type: :view do
  let(:run_unit) {
    RunUnit.create!(
      title: "MyString",
      description: "MyString",
      indentation_level: 1,
      run: nil
    )
  }

  before(:each) do
    assign(:run_unit, run_unit)
  end

  it "renders the edit run_unit form" do
    render

    assert_select "form[action=?][method=?]", run_unit_path(run_unit), "post" do
      assert_select "input[name=?]", "run_unit[title]"

      assert_select "input[name=?]", "run_unit[description]"

      assert_select "input[name=?]", "run_unit[indentation_level]"

      assert_select "input[name=?]", "run_unit[run_id]"
    end
  end
end
