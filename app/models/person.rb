class Person < ActiveRecord::Base
  validates_uniqueness_of :name
  validate :valid?
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

  def valid?
    response = HTTParty.get("https://consumerprofile.hipchat.com/v2/user/#{name}?auth_token=MuE1Ln34HkOgQ9SFIqynMbgBMrjGg3PVnrtLJrCb")

    if response.code == 200
      true
    else
      false
    end
  end

end
