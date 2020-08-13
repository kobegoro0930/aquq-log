class ScoresController < ApplicationController
  def index
    @groups = Group.order("id DESC")
    @comments = Comment.all
  end
end
