require 'foodcats'
require 'queue_manager'

class PartyController < ApplicationController

  def view
    @party = Party.find(params[:id])
  end

  def confirm
    guy = Person.find(params[:personid])
    guy.has_confirmed = true
    guy.save

    @party = Party.find(params[:id])
    HipchatMessenger.leave_now(@party) if @party.ready?

    redirect_to action: 'view', id: @party.id
  end
end
