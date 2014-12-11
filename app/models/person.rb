class Person < ActiveRecord::Base

	serialize :preferences, Array

  def ready?
    self.has_confirmed
  end

end
