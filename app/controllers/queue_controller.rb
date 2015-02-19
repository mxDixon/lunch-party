require 'foodcats'
require 'queue_manager'

class QueueController < ApplicationController
  def index
  end

  def add
  end

  def remove
  end

  def generate
    QueueManager.clear_and_generate
    redirect_to action: index
  end

  def destroy
    begin
      peeps = Person.where(name: params[:person][:name])
      peeps.first.destroy
      redirect_to action: 'bye'
    rescue ActiveRecord::RecordNotUnique
      redirect_to action: 'add', alert: 'That user is already in queue!'
    rescue => e
      logger.error 'EXCEPTION::'
      logger.info e.to_yaml
      redirect_to action: 'error'
    end
  end

  def create_person
    begin
      person = Person.create(person_params)

      if person.valid?
        redirect_to action: 'success'
      else
        redirect_to :back, :flash => { :error => person.errors.full_messages[0] }
      end
    rescue ActiveRecord::RecordNotUnique => e
      flash[:notice] = 'That user is already in queue!'
      redirect_to action: 'add'
    rescue ActiveRecord::RecordInvalid => e
      flash[:notice] = 'That user is already in queue!'
      redirect_to action: 'add'
    rescue => e
      logger.error 'EXCEPTION::'
      logger.info e.to_yaml
      redirect_to action: 'error'
    end
  end

  def success
  end

  def bye
  end

  def error
  end

  private

  def person_params
    params.require(:person).permit(:name, preferences: [])
  end

end
