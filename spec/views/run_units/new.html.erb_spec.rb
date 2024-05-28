require 'rails_helper'

RSpec.describe "run_units/new", type: :view do
  before(:each) do
    assign(:run_unit, RunUnit.new(
      title: "MyString",
      description: "MyString",
      indentation_level: 1,
      run: nil
    ))
  end

  it "renders new run_unit form" do
    render

    assert_select "form[action=?][method=?]", run_units_path, "post" do

      assert_select "input[name=?]", "run_unit[title]"

      assert_select "input[name=?]", "run_unit[description]"

      assert_select "input[name=?]", "run_unit[indentation_level]"

      assert_select "input[name=?]", "run_unit[run_id]"
    end
  end
end
