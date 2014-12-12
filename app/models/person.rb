class Person < ActiveRecord::Base
  attr_accessor :name
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
