# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do

  describe 'associations' do
    it { should belong_to(:world) }
    it { should have_one(:country) }
    it { should have_many(:races) }
  end
end
