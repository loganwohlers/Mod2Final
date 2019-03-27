class SkillPointsController < ApplicationController
  def create
  if can_spend?
    decrement_votes
    @vote = Vote.create(athlete_id: params[:athlete_id])
  end

  redirect_to athletes_path
end
end
