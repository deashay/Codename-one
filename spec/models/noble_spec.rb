# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Noble do

  describe 'associations' do
    it { should belong_to(:country) }
    it { should belong_to(:army) }
    it { should belong_to(:regiment) }
    it { should belong_to(:race) }
    it { should have_one(:rulled_country) }
  end
end
