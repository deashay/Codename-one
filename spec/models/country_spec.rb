# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Country do

  describe 'associations' do
    it { should belong_to(:owner) }
    it { should have_many(:armies) }
    it { should have_many(:cities) }
    it { should have_many(:lands) }
    it { should have_many(:nobles) }
    it { should have_one(:king) }
  end

  describe 'fields' do
    it { should have_field(:name).of_type(String) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
