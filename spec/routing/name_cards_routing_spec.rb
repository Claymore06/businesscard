require "spec_helper"

describe NameCardsController do
  describe "routing" do

    it "routes to #index" do
      get("companies/1/groups/1/users/1/name_cards").should route_to("name_cards#index", :company_id => "1", :group_id => "1", :user_id => "1")
    end

    it "routes to #new" do
      get("companies/1/groups/1/users/1/name_cards/new").should route_to("name_cards#new", :company_id => "1", :group_id => "1", :user_id => "1")
    end

    it "routes to #show" do
      get("companies/1/groups/1/users/1/name_cards/1").should route_to("name_cards#show", :company_id => "1", :group_id => "1", :user_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("companies/1/groups/1/users/1/name_cards/1/edit").should route_to("name_cards#edit",:company_id => "1", :group_id => "1", :user_id => "1",  :id => "1")
    end

    it "routes to #create" do
      post("companies/1/groups/1/users/1/name_cards").should route_to("name_cards#create", :company_id => "1", :group_id => "1", :user_id => "1")
    end

    it "routes to #update" do
      put("companies/1/groups/1/users/1/name_cards/1").should route_to("name_cards#update", :company_id => "1", :group_id => "1", :user_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("companies/1/groups/1/users/1/name_cards/1").should route_to("name_cards#destroy", :company_id => "1", :group_id => "1", :user_id => "1" , :id => "1")
    end

  end
end
