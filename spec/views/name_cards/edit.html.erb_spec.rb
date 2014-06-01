require 'spec_helper'

describe "name_cards/edit" do
  before(:each) do
    @name_card = assign(:name_card, stub_model(NameCard))
  end

  it "renders the edit name_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", name_card_path(@name_card), "post" do
    end
  end
end
