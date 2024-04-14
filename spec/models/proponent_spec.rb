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

  describe '#formatted_salary' do
    context 'when salary is present' do
      let(:proponent) { Proponent.new(salary: 150_000) }

      it 'returns the salary formatted as currency' do
        expect(proponent.formatted_salary).to eq('R$ 1.500,00')
      end
    end

    context 'when salary is nil' do
      let(:proponent) { Proponent.new(salary: nil) }

      it 'returns R$ 0,00' do
        expect(proponent.formatted_salary).to eq('R$ 0,00')
      end
    end
  end

  describe '#address_formatted' do
    let(:proponent) do
      Proponent.new(
        street: 'Main St',
        number: '123',
        city: 'Cityville',
        state: 'ST',
        zip: '12345'
      )
    end

    it 'formats the address correctly' do
      expect(proponent.address_formatted).to eq('Main St, nº 123, Cityville - ST, 12345')
    end
  end

  describe 'setter for salary' do
    let(:proponent) { Proponent.new(salary: 'R$ 1.500,00') }

    it 'removes non-numeric characters and sets salary correctly' do
      expect(proponent.salary).to eq(150_000)
    end
  end
end
