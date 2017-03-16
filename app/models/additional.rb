class Additional < ActiveRecord::Base
    has_many :property_additionals
	has_many :properties, :through => :property_additionals
end
