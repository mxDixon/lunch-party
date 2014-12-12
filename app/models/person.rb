class Person < ActiveRecord::Base
  validates_uniqueness_of :name

	serialize :preferences, Array

  def ready?
    self.has_confirmed
  end

  def unassign
    self.assigned = false
    self.party_id = nil
    self.has_confirmed = false
  end

end
