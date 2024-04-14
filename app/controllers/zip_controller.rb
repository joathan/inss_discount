# frozen_string_literal: true

# Path: app/controllers/zip_controller.rb
class ZipController < ApplicationController
  def search
    @address = ZipService.new(params[:zip]).call

    render json: @address
  end
end
