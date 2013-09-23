# -*- encoding : utf-8 -*-
require 'spec_helper'

describe RacesController do

  describe 'POST #create' do
    let(:user) { create(:user) }

    before do
      controller.stub(:current_user).and_return(user)
    end

    context 'with valid data' do
      it 'adds new race to current user' do
        expect{ post :create, race: attributes_for(:race) }.to change{ user.races.count }.by(1)
      end

      it 'creates a new race' do
        expect{ post :create, race: attributes_for(:race) }.to change{ Race.count }.by(1)
      end
    end

    context 'with invalid data' do
      it 'does not save new race' do
        expect{ post :create, race: attributes_for(:invalid_race) }.to_not change{ Race.count }
      end

      it 'render #new template' do
        post :create, race: attributes_for(:invalid_race)
        response.should render_template :new
      end
    end
  end

  describe 'PUT activate' do
    let(:user) { create(:user) }
    let(:race) { create(:race, user_id: user.id) }

    before do
      controller.stub(:current_user).and_return(user)
    end

    context 'when owner already joined world' do
      before do
        user.stub(:world).and_return( build(:world) )
      end

      it 'doesn\'t activate race' do
        expect{ put :activate, { id: race.id } }.not_to change{ race.active }
      end
    end

    context 'when owner didn\'t join world' do
      let(:races) { [create(:race, user: user),create(:race, user: user)] }

      it 'activates given race' do
        put :activate, { id: race.id } 
        race.reload.active.should eq(true)
      end

      it 'deactivates all other owner\'s races' do
        put :activate, { id: race.id }
        user.reload.races.map(&:id).should_not include(races.map(&:id))
      end
    end
  end
end
