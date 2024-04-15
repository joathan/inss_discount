# frozen_string_literal: true

# Path: app/jobs/update_proponent_job.rb
class UpdateProponentJob < ApplicationJob
  queue_as :default

  def perform(proponent_id:, salary:, inss_discount:)
    @proponent = Proponent.find(proponent_id)

    raise ActiveRecord::RecordNotFound if @proponent.blank?

    @proponent.update(salary:, inss_discount:)
  end
end
