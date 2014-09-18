require 'foodcats'

class QueueController < ApplicationController
  def index
  end

  def personify
    #todo do the person create and enqueue
    pref = params[:person]
    peep = Person.new
    peep.preferences = [pref[:pref1], pref[:pref2], pref[:pref3]]
    
  end

  def wait
  end

  def party
  end
end
