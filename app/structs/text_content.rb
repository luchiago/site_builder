# frozen_string_literal: true

TextContent = Struct.new(:title, :background_color, :content, :position, keyword_init: true) do
  def render
    TextContentCell.call(self).show
  end
end
