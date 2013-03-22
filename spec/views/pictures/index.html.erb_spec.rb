require 'spec_helper'

describe "pictures/index.html.erb" do
  before(:each) do
    assign(:pictures, [
      stub_model(Picture,
        :image => "Image"
      ),
      stub_model(Picture,
        :image => "Image"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
