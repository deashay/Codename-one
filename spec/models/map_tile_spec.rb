# -*- encoding : utf-8 -*-
require 'spec_helper'

describe MapTile do

  describe 'associations' do
    it { should belong_to(:world) }
    it { should belong_to(:influencing_city) }
    it { should belong_to(:country) }
    it { should have_many(:armies) }
    it { should have_many(:cities) }
    it { should have_many(:buildings) }
  end

  describe 'validations' do
    it { should validate_presence_of :world }
  end
end
