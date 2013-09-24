# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Building do

  describe 'associations' do
    it { should belong_to(:city) }
    it { should belong_to(:map_tile) }
    it { should have_many(:workers) }
  end
end
