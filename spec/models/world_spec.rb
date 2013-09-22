# -*- encoding : utf-8 -*-
require 'spec_helper'

describe World do

  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:map_tiles) }
    it { should have_many(:countries) }
    it { should have_field(:width) }
    it { should have_field(:height) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of(:width).greater_than(0) }
    it { should validate_numericality_of(:height).greater_than(0) }
  end

  describe '.generate_map' do
    let(:world) { create(:world) }

    it 'creates width*height map tiles for world' do
      amount = world.width*world.height
      expect{ world.generate_map }.to change{ world.map_tiles.count }.by(amount)
    end
  end
end
