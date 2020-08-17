# frozen_string_literal: true

class VideoCell < Cell::ViewModel
  property :url
  property :title
  property :position

  def show
    render
  end
end
