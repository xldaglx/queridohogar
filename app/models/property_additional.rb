class PropertyAdditional < ActiveRecord::Base
  belongs_to :additional
  belongs_to :property
  accepts_nested_attributes_for :property
end
