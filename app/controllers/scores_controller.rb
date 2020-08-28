class ScoresController < ApplicationController

  before_action :set_all
  
  def index
    @groups = Group.all.sort {|a,b| b.comments.average(:rate).to_f <=> a.comments.average(:rate).to_f}
    @comments = Comment.all
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end
end
