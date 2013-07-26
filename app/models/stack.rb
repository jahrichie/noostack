class Stack < ActiveRecord::Base
  default_scope order('created_at DESC')
  
  acts_as_votable
  #relationships
  has_many :ingredients,:dependent => :destroy
  has_many :stack_images, :dependent => :destroy
  has_many :goals, :dependent => :destroy
  #
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :stack_images, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :goals, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true


  attr_accessible :description, :name, :user_id,
    #mass
    :ingredients_attributes,:stack_images_attributes, :goals_attributes

  validates_presence_of :name, :description

  # scope :hotness, lambda { where('created_at ASC') }
  # scope :hotness, lambda {
  #   includes(:stack => [:ingredients]).
  #   where("catalog_item.close_date < ? and ", Time.current)
  # }

end

class String
  def is_number?
    true if Float(self) rescue false
  end
end
