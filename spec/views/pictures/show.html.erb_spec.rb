require 'spec_helper'

describe "pictures/show.html.erb" do
  before(:each) do
    @picture = assign(:picture, stub_model(Picture,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
  end
end
