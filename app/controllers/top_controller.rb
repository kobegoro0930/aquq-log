class TopController < ApplicationController
  before_action :set_all

  def index
    @groups = Group.last(5)
    @comments = Comment.all
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end
end
