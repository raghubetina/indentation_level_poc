require 'rails_helper'

RSpec.describe "runs/new", type: :view do
  before(:each) do
    assign(:run, Run.new(
      title: "MyString",
      description: "MyString"
    ))
  end

  it "renders new run form" do
    render

    assert_select "form[action=?][method=?]", runs_path, "post" do

      assert_select "input[name=?]", "run[title]"

      assert_select "input[name=?]", "run[description]"
    end
  end
end
