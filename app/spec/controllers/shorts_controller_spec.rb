require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ShortsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Short. As you add validations to Short, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { url: "https://google.com" } }

  let(:invalid_attributes) {
    { xyz: "hi" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShortsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #point" do
    context "with valid id parameter" do
      it "redirects to the url pointed by the id" do
        short = Short.create! valid_attributes
        get :point , {id: short.to_param}, valid_session
        expect(response).to redirect_to(valid_attributes[:url])
      end
    end
    context "with invalid id parameter" do
      it "should redirect to Short #new with a warning" do
        get :point , {id: "100"}, valid_session
        expect(response).to redirect_to(new_short_path)
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested short as @short" do
      short = Short.create! valid_attributes
      get :show, {:id => short.to_param}, valid_session
      expect(assigns(:short)).to eq(short)
    end
    context "with invalid id parameter" do
      it "redirects to Short #new with a warning" do
        get :show, {id: "100"}, valid_session
        expect(response).to redirect_to(new_short_path)
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "GET #new" do
    it "assigns a new short as @short" do
      get :new, {}, valid_session
      expect(assigns(:short)).to be_a_new(Short)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Short" do
        expect {
          post :create, {:short => valid_attributes}, valid_session
        }.to change(Short, :count).by(1)
      end

      it "assigns a newly created short as @short" do
        post :create, {:short => valid_attributes}, valid_session
        expect(assigns(:short)).to be_a(Short)
        expect(assigns(:short)).to be_persisted
      end

      it "redirects to the created short" do
        post :create, {:short => valid_attributes}, valid_session
        expect(response).to redirect_to(Short.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved short as @short" do
        post :create, {:short => invalid_attributes}, valid_session
        expect(assigns(:short)).to be_a_new(Short)
      end

      it "re-renders the 'new' template" do
        post :create, {:short => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
