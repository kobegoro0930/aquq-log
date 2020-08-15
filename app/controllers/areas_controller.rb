class AreasController < ApplicationController

  before_action :set_all

  def tokyo
    @groups = Group.where(area: "東京")
  end

  def kanagawa
  end

  def chiba
  end

  def ibaraki
  end

  def saitama
  end

  def tochigi
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end
end
