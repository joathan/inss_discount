# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateProponentJob, type: :job do
  subject(:job) { described_class.new }

  describe 'queue' do
    it 'is in the default queue' do
      expect(job.queue_name).to eq('default')
    end
  end

  describe '#perform' do
    let(:proponent) { create(:proponent) }
    let(:salary) { 1000 }
    let(:inss_discount) { 100 }

    it 'updates the proponent salary and inss discount' do
      job.perform(proponent_id: proponent.id, salary:, inss_discount:)

      proponent.reload

      expect(proponent.salary).to eq(salary)
      expect(proponent.inss_discount).to eq(inss_discount)
    end

    context 'when the proponent does not exist' do
      it 'raises a ActiveRecord::RecordNotFound' do
        expect { job.perform(proponent_id: 0, salary:, inss_discount:) }
          .to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
