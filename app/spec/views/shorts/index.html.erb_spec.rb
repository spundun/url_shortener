require 'rails_helper'

RSpec.describe "shorts/index", type: :view do
  before(:each) do
    assign(:shorts, [
      Short.create!(
        :url => "MyText"
      ),
      Short.create!(
        :url => "MyText"
      )
    ])
  end

  it "renders a list of shorts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
