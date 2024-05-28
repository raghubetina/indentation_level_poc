require "rails_helper"

RSpec.describe RunUnitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/run_units").to route_to("run_units#index")
    end

    it "routes to #new" do
      expect(get: "/run_units/new").to route_to("run_units#new")
    end

    it "routes to #show" do
      expect(get: "/run_units/1").to route_to("run_units#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/run_units/1/edit").to route_to("run_units#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/run_units").to route_to("run_units#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/run_units/1").to route_to("run_units#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/run_units/1").to route_to("run_units#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/run_units/1").to route_to("run_units#destroy", id: "1")
    end
  end
end
