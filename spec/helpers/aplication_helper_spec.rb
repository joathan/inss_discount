# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#active_class' do
    it 'returns active when current_page? is true' do
      allow(helper).to receive(:current_page?).and_return(true)

      expect(helper.active_class('/')).to eq('active')
    end

    it 'returns empty string when current_page? is false' do
      allow(helper).to receive(:current_page?).and_return(false)

      expect(helper.active_class('/')).to eq('')
    end
  end

  describe '#errors_for' do
    let(:form) { double(object: double(errors: { name: ['cannot be blank'] })) }

    it 'returns error message wrapped in a paragraph' do
      expect(helper.errors_for(form, :name)).to eq('<p class="text-danger ms-2 fw-medium">cannot be blank</p>')
    end

    it 'returns nil when the field has no errors' do
      form = double(object: double(errors: nil))

      expect(helper.errors_for(form, :name)).to be_nil
    end
  end

  describe '#valid' do
    let(:form) { double(object: double(errors: { name: ['cannot be blank'] })) }

    it 'returns is-valid when there are no errors' do
      form = double(object: double(errors: { name: [] }))

      expect(helper.valid(form, :name)).to eq('is-valid')
    end

    it 'returns is-invalid when there are errors' do
      allow(form.object.errors).to receive(:blank?).and_return(false)

      expect(helper.valid(form, :name)).to eq('is-invalid')
    end
  end
end
