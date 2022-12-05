# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'table' do
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:content).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:rating).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:status).of_type(:integer).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:user) }
  end
end
