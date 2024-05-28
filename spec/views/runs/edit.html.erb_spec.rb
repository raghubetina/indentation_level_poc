require "rails_helper"

RSpec.describe "runs/edit", type: :view do
  let(:run) {
    Run.create!(
      title: "MyString",
      description: "MyString"
    )
  }

  before(:each) do
    assign(:run, run)
  end

  it "renders the edit run form" do
    render

    assert_select "form[action=?][method=?]", run_path(run), "post" do
      assert_select "input[name=?]", "run[title]"

      assert_select "input[name=?]", "run[description]"
    end
  end
end
