class AreasController < ApplicationController
  def tokyo
    @groups = Group.where(area: "東京都")
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
end
