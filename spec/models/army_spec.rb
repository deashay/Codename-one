# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Army do

  describe 'associations' do
    it { should belong_to(:map_tile) }
    it { should belong_to(:country) }
    it { should have_one(:general) }
    it { should have_many(:regiments) }
    it { should have_many(:resources) }
  end

  describe 'fields' do
    it { should have_field(:name).of_type(String) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
