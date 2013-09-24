# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Regiment do

  describe 'associations' do
    it { should belong_to(:army) }
    it { should have_many(:soldiers) }
    it { should have_one(:officer) }
  end

  describe 'fields' do
    it { should have_field(:name).of_type(String) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
