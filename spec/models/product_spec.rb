require 'spec_helper'

describe Product do

	before(:each) do 
		# @product = FactoryGirl.create(:product)
		@attr = {
			name:					"Online Shop",
  			estimated_time:			"In 2 weeks",
 			description:             "Some unusual description!",
 			price: 					100
		}
	end
  
  	describe "creation" do
    	it "should be successful given right attributes" do
      		Product.create!(@attr)
     	#response.should be_success
    	end

    	describe "fails, because:" do
			it "should have a name" do 
				Product.new(@attr.merge(name: "")).should_not be_valid
			end 

			it "should have a price" do 
				Product.new(@attr.merge(price: "")).should_not be_valid
			end 

			it "should have an unique name" do 
				Product.create(@attr)
				Product.new(@attr).should_not be_valid
			end   		
    	end
	end



end