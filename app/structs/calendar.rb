# frozen_string_literal: true

Calendar = Struct.new(:title, :position, keyword_init: true) do
  def render
    CalendarCell.call(self).show
  end
end
