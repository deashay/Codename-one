# -*- encoding : utf-8 -*-
require 'spec_helper'

describe UserDecorator do
  let(:world) { build(:world) }
  let(:user) { build(:user) }
  subject { UserDecorator.decorate user }

  describe '.world' do
    context 'with existing world' do
      it 'returns user\'s world' do
        user.world = world
        subject.world.should eq(world)
      end
    end

    context 'without existing world' do
      it 'prints error message' do
        subject.world.should eq('You are not connected to any world')
      end
    end
  end
end