# frozen_string_literal: true

# Path: app/helpers/proponents_helper.rb
module ProponentsHelper
  def address_formatted(proponent)
    "#{proponent.street}, nº #{proponent.number}, #{proponent.city} - #{proponent.state}, #{proponent.zip}"
  end
end
