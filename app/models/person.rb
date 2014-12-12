class Person < ActiveRecord::Base
  validates_uniqueness_of :name

	serialize :preferences, Array

  def ready?
    self.has_confirmed
  end

end
