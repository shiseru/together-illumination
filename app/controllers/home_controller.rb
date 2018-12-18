class HomeController < ApplicationController
  def show
  end

  def top

  end

  def about

  end

  def mypage
    @rooms = Room.where(owner_id: current_user.id).or(Room.where(participant_id: current_user.id))
  end
end
