require 'spec_helper'

describe "name_cards/show" do
  before(:each) do
    @name_card = assign(:name_card, stub_model(NameCard))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
