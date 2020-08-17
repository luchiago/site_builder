# frozen_string_literal: true

class BasicInfoCell < Cell::ViewModel
  property :title
  property :icon
  property :background_color
  property :banner_background_color
  property :position

  def show
    render
  end
end
