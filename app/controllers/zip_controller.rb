# frozen_string_literal: true

class ZipController < ApplicationController
  def search
    @address = ZipService.new(params[:zip]).call

    render json: @address
  end
end
