# Используя символ ':user', мы указываем Factory Girl на необходимость симулировать модель User.
FactoryGirl.define do 
	factory :product do
  		name					"Online Shop"
  		estimated_time			"In 2 weeks"
 		description             "Some unusual description!"
 		price 					100
	end

	#sequence :email do |n|
	#	"person-#{n}@example.com"
	#end

	#factory :micropost do
	#	content = "some useless content"
	#	user
	#end

end
