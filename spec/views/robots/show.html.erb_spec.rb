require 'rails_helper'

RSpec.describe "robots/show", type: :view do
  before(:each) do
    @robot = assign(:robot, Robot.create!(
      :name => "Name",
      :owner_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
