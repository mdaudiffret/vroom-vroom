class RacesController < ApplicationController
  def index
    @races = policy_scope(Race)
  end
end
