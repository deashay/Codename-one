# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Army do
  
  describe 'associations' do
    it { should belong_to(:map_tile) }
    it { should belong_to(:country) }
    it { should have_one(:general) }
    it { should have_many(:regiments) }
  end
end
