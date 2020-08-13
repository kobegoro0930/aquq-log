class ScoresController < ApplicationController

  before_action :set_all
  
  def index
    @groups = Group.order("id DESC")
    @comments = Comment.all
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end
end
