# -*- encoding : utf-8 -*-
require 'spec_helper'

describe City do

  describe 'associations' do
    it { should belong_to(:country) }
    it { should belong_to(:map_tile) }
    it { should have_many(:citizen) }
    it { should have_many(:buildings) }
    it { should have_many(:influenced_tiles) }
  end
end
