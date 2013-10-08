# -*- encoding : utf-8 -*-
require 'spec_helper'

describe World do
  let!(:world) { create(:world) }

  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:map_tiles) }
    it { should have_many(:countries) }
    it { should belong_to(:global_configuration) }
  end

  describe 'fields' do
    it { should have_field(:name).of_type(String) }
    it { should have_field(:width).of_type(Integer) }
    it { should have_field(:height).of_type(Integer) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_numericality_of(:width).greater_than(0) }
    it { should validate_numericality_of(:height).greater_than(0) }
  end

  describe '.generate_map' do
    it 'creates width*height map tiles for world' do
      amount = world.width*world.height
      expect{ world.generate_map }.to change{ world.map_tiles.count }.by(amount)
    end
  end

  describe '.config' do
    let!(:global_configuration) { create(:global_configuration, is_global: true) }
    let(:config) { create(:global_configuration) }

    it 'returns global config when doesnt have its own' do
      world.config.should eq(global_configuration)
    end

    it 'returns own config when has one' do
      world.global_configuration = config
      world.config.should eq(config)
    end
  end
end
