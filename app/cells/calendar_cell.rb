# frozen_string_literal: true

class CalendarCell < Cell::ViewModel
  property :title
  property :position

  def show
    render
  end
end
