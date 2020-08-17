# frozen_string_literal: true

BasicInfo = Struct.new(:title, :icon, :background_color, :banner_background_color, keyword_init: true) do
  def render
    BasicInfoCell.call(self).show
  end
end
