require "rails_helper"

RSpec.describe ShortsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/shorts/new").to route_to("shorts#new")
    end

    it "routes to #show" do
      expect(:get => "/shorts/1").to route_to("shorts#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shorts").to route_to("shorts#create")
    end

    #Route to the point method
    it "should route /:id to #point(:id) (for actual short url dereferencing)" do
      expect(get: "/1").to route_to("shorts#point", id: "1")
    end

    it "should treat route to #index as an invalid route to point" do
      expect(:get => "/shorts").to route_to("shorts#point", id: "shorts")
    end

    #Blocked resource routes
    it "blocks routes to #edit" do
      expect(:get => "/shorts/1/edit").not_to be_routable
    end

    it "blocks routes to #update" do
      expect(:put => "/shorts/1").not_to be_routable
    end

    it "blocks routes to #destroy" do
      expect(:delete => "/shorts/1").not_to be_routable
    end

  end
end
