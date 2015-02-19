class HipchatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, "#{value} is not a valid hipchat id." unless is_hipchat(value)
  end

  def is_hipchat(id)
    response = HTTParty.get("https://consumerprofile.hipchat.com/v2/user/#{id}?auth_token=MuE1Ln34HkOgQ9SFIqynMbgBMrjGg3PVnrtLJrCb")
    puts "we checkin hipchat and response is #{response.code}"
    if response.code == 200
      true
    else
      false
    end
  end

end