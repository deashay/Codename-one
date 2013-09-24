# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Race do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:people) }
    it { should have_many(:nobles) }
    it { should have_and_belong_to_many(:origins) }
    it { should have_and_belong_to_many(:succesors) }
  end

  describe 'fields' do
    it { should have_field(:name).of_type(String) }
    it { should have_field(:active).of_type(Boolean) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

end
