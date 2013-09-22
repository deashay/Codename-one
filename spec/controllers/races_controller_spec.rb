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
end
