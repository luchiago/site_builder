# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Site, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:builds) }
    it { is_expected.to belong_to(:current_build).class_name('Build').optional }
  end
end
