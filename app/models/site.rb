# frozen_string_literal: true

class Site < ApplicationRecord
  has_many :builds, dependent: :destroy
  belongs_to :current_build, class_name: 'Build', optional: true

  def current_build_html
    current_build&.html_build&.html_safe
  end

  def builds_ordered
    builds.all.order(created_at: :desc)
  end
end
