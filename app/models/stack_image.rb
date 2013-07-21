class StackImage < ActiveRecord::Base
  attr_accessible :name, :stack_id, :url

  #relationships
  belongs_to :stack
end
