# frozen_string_literal: true

class Site < ApplicationRecord
  has_many :builds, dependent: :destroy
  belongs_to :current_build, class_name: 'Build', optional: true
end
