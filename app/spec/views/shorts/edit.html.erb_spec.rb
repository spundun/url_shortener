require 'rails_helper'

RSpec.describe "shorts/edit", type: :view do
  before(:each) do
    @short = assign(:short, Short.create!(
      :url => "MyText"
    ))
  end

  it "renders the edit short form" do
    render

    assert_select "form[action=?][method=?]", short_path(@short), "post" do

      assert_select "textarea#short_url[name=?]", "short[url]"
    end
  end
end
