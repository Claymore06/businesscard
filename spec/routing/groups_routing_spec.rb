require "spec_helper"

describe GroupsController do
  describe "routing" do

    it "routes to #index" do
      get("companies/1/groups").should route_to("groups#index", :company_id => "1")
    end

    it "routes to #new" do
      get("companies/1/groups/new").should route_to("groups#new",:company_id => "1" )
    end

    it "routes to #show" do
      get("companies/1/groups/1").should route_to("groups#show", :company_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("companies/1/groups/1/edit").should route_to("groups#edit",:company_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("companies/1/groups").should route_to("groups#create",:company_id => "1" )
    end

    it "routes to #update" do
      put("companies/1/groups/1").should route_to("groups#update", :company_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("companies/1/groups/1").should route_to("groups#destroy",:company_id => "1", :id => "1")
    end

  end
end
