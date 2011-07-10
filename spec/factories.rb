# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
	user.name										"Ryan Johanningmeier"
	user.email									"ryanjohanningmeier@bmarketbooks.com"
	user.image
	user.password								"justcrap"
	user.password_confirmation	"justcrap"
	user.status									"active"
end
