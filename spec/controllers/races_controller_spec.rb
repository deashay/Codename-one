# -*- encoding : utf-8 -*-
require 'spec_helper'

describe RacesController do

  describe 'CREATE' do
    let(:user) { create(:user) }
    let(:race_params) { { race: { name: 'somename' }} }

    before do
      controller.stub(:current_user).and_return(user)
    end

    it 'Adds new race to current user' do
      expect{ post :create, race_params }.to change{ user.races.count }.by(1)
    end

    it 'Creates a new race' do
      expect{ post :create, race_params }.to change{ Race.count }.by(1)
    end
  end
end
