# -*- encoding : utf-8 -*-
require 'spec_helper'

describe World do

  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:map_tiles) }
    it { should have_many(:countries) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end
end
