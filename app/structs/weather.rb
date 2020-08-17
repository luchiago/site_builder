# frozen_string_literal: true

Weather = Struct.new(:location, :position, keyword_init: true) do
  def render
    WeatherCell.call(self).show
  end
end
