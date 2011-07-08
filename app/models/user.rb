# == Schema Information
#
# Table name: users
#
#  userId       :integer(4)      not null
#  userFullName :string(125)
#  userName     :string(20)
#  userPassword :string(32)
#  userEmail    :string(125)
#  schoolId     :integer(4)
#  userType     :string(0)       default("user"), not null
#  userStatus   :string(0)       default("active"), not null
#

class User < ActiveRecord::Base
	attr_accessible :userFullName, :userName, :userEmail, :schoolId
end
