# frozen_string_literal: true

# Path: app/controllers/inss_controller.rb
class InssController < ApplicationController
  def calculate
    inss_value = InssService.calculate_contribution(params[:salary].to_i)

    render json: inss_value
  end
end
