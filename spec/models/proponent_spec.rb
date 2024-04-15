# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proponent, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:contacts).dependent(:destroy) }
  end

  describe 'nested attributes' do
    let(:proponent_with_contacts) do
      create(:proponent, contacts_attributes: [{ kind: 'personal', phone: '123456789' }])
    end
    let(:proponent_without_contacts) { create(:proponent, contacts_attributes: [{ kind: '', phone: '' }]) }

    it 'rejects contacts if all attributes are blank' do
      expect(proponent_without_contacts.contacts.empty?).to be true
    end

    it 'accepts nested attributes for contacts and allows destroy' do
      expect(proponent_with_contacts.contacts.size).to eq 1

      proponent_with_contacts.update(contacts_attributes: [{ id: proponent_with_contacts.contacts.first.id,
                                                             _destroy: '1' }])

      expect(proponent_with_contacts.contacts.reload.empty?).to be true
    end
  end

  describe 'setter for salary' do
    let(:proponent) { Proponent.new(salary: 'R$ 1.500,00') }

    it 'removes non-numeric characters and sets salary correctly' do
      expect(proponent.salary).to eq(150_000)
    end
  end
end
