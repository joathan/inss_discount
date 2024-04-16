# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proponent, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:salary) }
    it { should validate_presence_of(:inss_discount) }
    it { should validate_numericality_of(:salary).is_greater_than(0) }
    it { should validate_numericality_of(:inss_discount).is_greater_than(0) }
  end

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
end
