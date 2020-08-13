class TopController < ApplicationController
  def index
    @groups = Group.last(5)
    @comments = Comment.all
  end
end
