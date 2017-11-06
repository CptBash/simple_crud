require 'rails_helper'

RSpec.describe "robots/edit", type: :view do
  before(:each) do
    @robot = assign(:robot, Robot.create!(
      :name => "MyString",
      :owner_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit robot form" do
    render

    assert_select "form[action=?][method=?]", robot_path(@robot), "post" do

      assert_select "input#robot_name[name=?]", "robot[name]"

      assert_select "input#robot_owner_id[name=?]", "robot[owner_id]"

      assert_select "textarea#robot_description[name=?]", "robot[description]"
    end
  end
end
