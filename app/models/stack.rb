class Stack < ActiveRecord::Base
  

  #relationships
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  attr_accessible :description, :name,
    :ingredients_attributes

  validates_presence_of :name, :description
  

end
