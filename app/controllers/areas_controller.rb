class AreasController < ApplicationController

  before_action :set_all

  def tokyo
    @groups = Group.where(area: "東京")
  end

  def kanagawa
    @groups = Group.where(area: "神奈川")
  end

  def chiba
    @groups = Group.where(area: "千葉")
  end

  def ibaraki
    @groups = Group.where(area: "茨城")
  end

  def saitama
    @groups = Group.where(area: "埼玉")
  end

  def tochigi
    @groups = Group.where(area: "栃木")
  end

  private

  def set_all
    @all_comments = Comment.all
    @all_groups = Group.all
  end
end
