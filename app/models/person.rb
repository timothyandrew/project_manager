class Person < ActiveRecord::Base
  
  has_many :roles
  has_many :projects, :through => :roles
  
  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  
  before_save :cleanup
  
  def name
    "#{first_name} #{last_name}"
  end

  private
  def cleanup
    self[:first_name] = self[:first_name].capitalize
  end
  
end
