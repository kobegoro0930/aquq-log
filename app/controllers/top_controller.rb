class TopController < ApplicationController
  before_action :set_all

  def index
    @groups = Group.last(5)
    @search_params = group_search_params
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end

  def group_search_params
    params.fetch(:search, {}).permit(:area, :text)
  end
  
end
