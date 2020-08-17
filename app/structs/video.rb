# frozen_string_literal: true

Video = Struct.new(:title, :url, :position, keyword_init: true) do
  def render
    VideoCell.call(self).show
  end
end
