class Stack < ActiveRecord::Base
  default_scope order('created_at DESC')

  #relationships
  has_many :ingredients
  has_many :stack_images

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :stack_images, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true


  attr_accessible :description, :name, :user_id,
    :ingredients_attributes,:stack_images_attributes

  validates_presence_of :name, :description
  

end

class String
  def is_number?
    true if Float(self) rescue false
  end
end
