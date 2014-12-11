require 'httparty'

class HipchatMessenger

  def self.party_ready(party)
    party.people.each do |peep|
      response = HTTParty.post("https://consumerprofile.hipchat.com/v2/user/#{peep.name}/message?auth_token=MuE1Ln34HkOgQ9SFIqynMbgBMrjGg3PVnrtLJrCb",
                               :body => self.ready_message(party, peep),
                               :headers => {'content-type' => 'text/plain'}
      )
      puts "#{peep} missed a message " + response.request +  " " + response.to_yaml if response.code != 204
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

  private

  def self.ready_message(party, person)
    "Your party is ready! Click here localhost:3000/party/#{party.id}/confirm/#{person.id} to confirm!"
  end

  def self.leave_message
    "Everyone has confirmed in your party! Meet at the LL elevator to embark!"
  end
end