class Stack < ActiveRecord::Base
  default_scope order('created_at DESC')

  #relationships
  has_many :ingredients
  
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  attr_accessible :description, :name, :user_id,
    :ingredients_attributes

  validates_presence_of :name, :description
  

end
