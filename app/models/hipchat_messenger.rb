require 'httparty'

class HipchatMessenger

  def self.party_ready(party)
    # msg = self.create_party_message(party.id)
    #
    # party.people.each do |peep|
    #   response = HTTParty.post("https://consumerprofile.hipchat.com/v2/user/#{peep.name}/message?auth_token=MuE1Ln34HkOgQ9SFIqynMbgBMrjGg3PVnrtLJrCb",
    #                            :body => msg,
    #                            :headers => {'content-type' => 'text/plain'}
    #   )
    #   puts "#{peep} missed a message " + response.request +  " " + response.to_yaml if response.code != 204
    # end
  end

  def self.leave_now(party)
    msg = self.leave_message

    party.zombies.each do |z|
      response = HTTParty.post("https://consumerprofile.hipchat.com/v2/user/#{z}/message?auth_token=MuE1Ln34HkOgQ9SFIqynMbgBMrjGg3PVnrtLJrCb",
                               :body => msg,
                               :headers => {'content-type' => 'text/plain'}
      )
      puts "#{z} missed a message " + response.request +  " " + response.to_yaml if response.code != 204
    end
  end

  private

  def self.ready_message(partyid)
    "Your party is ready! Visit localhost:3000/party/#{partyid} to confirm!"
  end

  def self.leave_message
    "Everyone has confirmed in your party! Meet at the LL elevator to embark!"
  end
end