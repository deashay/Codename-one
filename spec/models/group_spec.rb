# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Group do

  describe 'associations' do
    it { should belong_to(:owner) }
    it { should have_one(:race) }
    it { should have_one(:nationality) }
  end

  describe 'fields' do
    it { should have_field(:gender) }
    it { should have_field(:count) }
    it { should have_field(:used) }
  end
end
