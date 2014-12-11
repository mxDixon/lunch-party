class PartyController < ApplicationController

  def view
    @party = Party.find(params[:id])
  end

  def confirm
    guy = Person.find_by(name: params[:person][:name])
    guy.has_confirmed = true
    guy.save

    @party = Party.find(guy.party_id)
    HipchatMessenger.leave_now(@party) if @party.ready?

    redirect_to action: 'view', id: @party.id
  end
end
