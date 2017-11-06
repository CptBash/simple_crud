require 'rails_helper'

RSpec.describe "robots/index", type: :view do
  before(:each) do
    assign(:robots, [
      Robot.create!(
        :name => "Name",
        :owner_id => 1,
        :description => "MyText"
      ),
      Robot.create!(
        :name => "Name",
        :owner_id => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of robots" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
