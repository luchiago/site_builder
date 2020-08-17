# frozen_string_literal: true

class TextContentCell < Cell::ViewModel
  property :title
  property :background_color
  property :content
  property :position

  def show
    render
  end
end
