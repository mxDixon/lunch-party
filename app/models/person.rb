require 'hipchat_validator'

class Person < ActiveRecord::Base
  validates_uniqueness_of :name
  validates :name, hipchat: true
	serialize :preferences, Array

  def ready?
    self.has_confirmed
  end

  def unassign
    peep = Person.find(self.id)
    peep.assigned = false
    peep.party_id = nil
    peep.has_confirmed = false
    peep.save
  end

end

