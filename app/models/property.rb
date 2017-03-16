class Property < ActiveRecord::Base
	has_many :property_images, :dependent => :destroy
	has_many :property_additionals, :dependent => :destroy
	has_many :additionals, :through => :property_additionals, :dependent => :destroy
	has_many :contacts
	belongs_to :operation
	belongs_to :type
	belongs_to :currency
	belongs_to :user
	accepts_nested_attributes_for :property_additionals
	accepts_nested_attributes_for :property_images
end
