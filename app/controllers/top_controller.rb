class TopController < ApplicationController
  def index
    @groups = Group.order("id DESC")
  end
end
