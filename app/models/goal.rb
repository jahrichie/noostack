class Goal < ActiveRecord::Base
  attr_accessible :description, :stack_id
  
  #relationships
  belongs_to :stack
end
