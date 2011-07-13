namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		admin = User.create!(:name => "Example User", :email => "example@bmarketbooks.com", :password => "justcrap", :password_confirmation => "justcrap")
		admin.toggle!(:admin)
		99.times do |n|
			name = Faker::Name.name
			email = "user-#{n+1}@bmarketbooks.com"
			password = "password"
			User.create!(:name => name, :email => email, :password => password, :password_confirmation => password)
		end
		User.all(:limit => 6).each do |user|
			50.times do
				user.listings.create!(:title => Faker::Lorem.sentence(4), :content => Faker::Lorem.sentence(5), :condition => "Good", :price => "$00.00", :active => "active", :book_id => "1")
			end
		end
	end
end
