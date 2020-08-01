class ScoresController < ApplicationController
  def index
    @groups = Group.order("id DESC")
  end
end
