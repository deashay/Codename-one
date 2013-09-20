# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Attributable do

  describe 'associations' do
    it { should have_many(:skills) }
    it { should have_many(:stats) }
    it { should have_many(:perks) }
  end
end
