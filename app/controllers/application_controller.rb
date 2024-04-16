# frozen_string_literal: true

# Path: app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  private

  def set_locale
    I18n.locale = cookies[:locale] || I18n.default_locale
  end
end
