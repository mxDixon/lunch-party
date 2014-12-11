require 'foodcats'
require 'queue_manager'

class QueueController < ApplicationController
  def index
  end

  def personify
    #todo do the person create and enqueue
    pref = params[:person]
    peep = Person.new
    peep.preferences = [pref[:pref1].to_i, pref[:pref2].to_i, pref[:pref3].to_i]
    peep.name = params[:person][:name]
    peep.save

    error = false

    QueueManager.generate_parties(Person.all, Party.all)

    if error
      redirect_to action: 'error'
    else
      redirect_to action: 'success'
    end
  end

  def success
  end

  def error
  end
end
