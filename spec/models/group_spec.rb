# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Group do

  describe 'associations' do
    it { should belong_to(:owner) }
    it { should have_one(:race) }
    it { should have_one(:nationality) }
  end

  describe 'fields' do
    it { should have_field(:gender).of_type(Boolean) }
    it { should have_field(:count).of_type(Integer) }
    it { should have_field(:used).of_type(Integer) }
  end
end
