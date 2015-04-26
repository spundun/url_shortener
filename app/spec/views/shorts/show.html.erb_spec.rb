require 'rails_helper'

RSpec.describe "shorts/show", type: :view do
  before(:each) do
    @short = assign(:short, Short.create!(
      :url => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
