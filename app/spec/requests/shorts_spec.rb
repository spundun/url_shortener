require 'rails_helper'

RSpec.describe "Shorts", type: :request do
  describe "GET /shorts" do
    context "without id" do
      it "should redirect to Short #new"
    end
    context "with invalid id parameter" do
      it "should redirect to Short #new with a warning"
    end
  end
end
