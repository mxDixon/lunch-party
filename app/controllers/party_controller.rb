class PartyController < ApplicationController

  def view
    @party = Party.find(params[:id])
  end

  def confirm
    Person.find(params[:person].id).has_confirmed = true

    redirect_to :view
  end
end