require 'rails_helper'

RSpec.describe "robots/new", type: :view do
  before(:each) do
    assign(:robot, Robot.new(
      :name => "MyString",
      :owner_id => 1,
      :description => "MyText"
    ))
  end

  it "renders new robot form" do
    render

    assert_select "form[action=?][method=?]", robots_path, "post" do

      assert_select "input#robot_name[name=?]", "robot[name]"

      assert_select "input#robot_owner_id[name=?]", "robot[owner_id]"

      assert_select "textarea#robot_description[name=?]", "robot[description]"
    end
  end
end
