require 'spec_helper'

describe "name_cards/new" do
  before(:each) do
    assign(:name_card, stub_model(NameCard).as_new_record)
  end

  it "renders new name_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", name_cards_path, "post" do
    end
  end
end
