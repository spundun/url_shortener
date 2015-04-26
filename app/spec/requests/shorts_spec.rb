require 'rails_helper'

RSpec.describe "Shorts", type: :request do
  describe "GET /shorts" do
    context "without id" do
      it "should redirect to Short #new" do
        get "/"
        expect(response).to redirect_to(new_short_path)
      end
    end
    context "with invalid id parameter" do
      it "should redirect to Short #new with a warning" do
        get "/1000"
        expect(response).to redirect_to(new_short_path)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
