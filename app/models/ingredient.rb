class Ingredient < ActiveRecord::Base

  #relationships
  belongs_to :stack

  BASE = ["Coffee","Tea", "THC"]
  attr_accessible :description, :name, :stack_id
  
  # validates_presence_of :name,:stack_id
end
