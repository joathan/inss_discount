# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/proponents', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    proponent = attributes_for(:proponent)
  end

  let(:invalid_attributes) do
    proponent = attributes_for(:proponent)
    proponent[:name] = nil
    proponent
  end

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Proponent.create! valid_attributes
      get proponents_url

      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      proponent = Proponent.create! valid_attributes
      get proponent_url(proponent)

      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_proponent_url

      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      proponent = Proponent.create! valid_attributes
      get edit_proponent_url(proponent)

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Proponent' do
        expect do
          post proponents_url, params: { proponent: valid_attributes }
        end.to change(Proponent, :count).by(1)
      end

      it 'redirects to the created proponent' do
        post proponents_url, params: { proponent: valid_attributes }

        expect(response).to redirect_to(proponent_url(Proponent.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Proponent' do
        expect do
          post proponents_url, params: { proponent: invalid_attributes }
        end.to change(Proponent, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post proponents_url, params: { proponent: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    let!(:proponent) { Proponent.create!(valid_attributes) }

    context 'with valid parameters' do
      let(:new_attributes) do
        proponent = attributes_for(:proponent)
        proponent[:name] = 'New Name'
        proponent
      end

      it 'updates the requested proponent' do
        patch proponent_url(proponent), params: { proponent: new_attributes }
        proponent.reload

        expect(proponent.name).to eq('New Name')
      end

      it 'redirects to the proponent' do
        patch proponent_url(proponent), params: { proponent: new_attributes }
        proponent.reload

        expect(response).to redirect_to(proponent_url(proponent))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch proponent_url(proponent), params: { proponent: invalid_attributes }
        
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:proponent) { Proponent.create!(valid_attributes) }

    it 'destroys the requested proponent' do
      expect do
        delete proponent_url(proponent)
      end.to change(Proponent, :count).by(-1)
    end

    it 'redirects to the proponents list' do
      delete proponent_url(proponent)

      expect(response).to redirect_to(proponents_url)
    end
  end
end
