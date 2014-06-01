require 'spec_helper'

describe "name_cards/index" do
  before(:each) do
    assign(:name_cards, [
      stub_model(NameCard),
      stub_model(NameCard)
    ])
  end

  it "renders a list of name_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
