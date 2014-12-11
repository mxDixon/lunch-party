require 'httparty'

class HipchatMessenger

  def self.message_party_people(party)
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

  private

  def self.create_party_message(partyid)
    "Your party is ready! Visit localhost:3000/party/#{partyid} to confirm!"
  end
end