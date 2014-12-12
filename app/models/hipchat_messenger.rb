require 'httparty'

class HipchatMessenger

  def self.party_ready(party)
    party.people.each do |peep|
      response = HTTParty.post("https://consumerprofile.hipchat.com/v2/user/#{peep.name}/message?auth_token=MuE1Ln34HkOgQ9SFIqynMbgBMrjGg3PVnrtLJrCb",
                               :body => self.ready_message(party, peep),
                               :headers => {'content-type' => 'text/plain'}
      )
      puts "#{peep} missed a message " + response.request.to_yaml +  " " + response.to_yaml if response.code != 204
    end
  end

  def self.leave_now(party)
    party.zombies.each do |z|
      response = HTTParty.post("https://consumerprofile.hipchat.com/v2/user/#{z}/message?auth_token=MuE1Ln34HkOgQ9SFIqynMbgBMrjGg3PVnrtLJrCb",
                               :body => self.leave_message,
                               :headers => {'content-type' => 'text/plain'}
      )
      puts "#{z} missed a message " + response.request.to_yaml +  " " + response.to_yaml if response.code != 204
    end
  end

  def self.requeue(party)
    party.people.each do |p|
      response = HTTParty.post("https://consumerprofile.hipchat.com/v2/user/#{p.name}/message?auth_token=MuE1Ln34HkOgQ9SFIqynMbgBMrjGg3PVnrtLJrCb",
                               :body => self.requeue_message,
                               :headers => {'content-type' => 'text/plain'}
      )
      puts "#{p} missed a message " + response.request.to_yaml +  " " + response.to_yaml if response.code != 204
    end
  end
  private

  def self.ready_message(party, person)
    "Your party has formed! Click here https://lunchparty.herokuapp.com/party/#{party.id}/confirm/#{person.id} to confirm!"
  end

  def self.leave_message
    "Everyone has confirmed in your party! Meet at the LL elevator to embark!"
  end

  def self.requeue_message
    "Not enough people in your party have confirmed the invitation, so you will return to the queue."
  end
end