# frozen_string_literal: true

class WeatherCell < Cell::ViewModel
  property :location
  property :position

  def show
    render
  end
end
