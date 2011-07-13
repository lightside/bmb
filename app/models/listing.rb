class Listing < ActiveRecord::Base
	attr_accessible :title, :content, :condition, :price, :active
	
	belongs_to :user
	
	validates :title, :presence => true, :length => { :maximum => 140 }
	validates :content, :presence => true, :length => { :maximum => 250 }
	validates :condition, :presence => true
	validates :price, :presence => true
	validates :active, :presence => true
	validates :user_id, :presence => true
	
	default_scope :order => 'listings.created_at DESC'
end
