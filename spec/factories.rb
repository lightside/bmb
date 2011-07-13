# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
	user.name										"Ryan Johanningmeier"
	user.email									"ryanjohanningmeier@bmarketbooks.com"
	user.image
	user.password								"justcrap"
	user.password_confirmation	"justcrap"
	user.status									"active"
end

Factory.sequence :email do |n|
	"person-#{n}@bmarketbooks.com"
end

Factory.define :listing do |listing|
	listing.title "Some title"
	listing.content "Some content"
	listing.condition "Good"
	listing.price "$10.30"
	listing.active "true"
	listing.association :user
end
