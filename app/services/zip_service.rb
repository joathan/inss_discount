# frozen_string_literal: true

# Path: app/services/zip_service.rb
class ZipService
  URL = 'https://viacep.com.br/ws/'

  def initialize(zip)
    @zip = zip
  end

  def call
    response = HTTParty.get("#{URL}#{@zip}/json")
    return JSON.parse(response.body) if response.code == 200

    raise StandardError, 'CEP inválido'
  rescue Timeout::Error
    raise StandardError, 'Tempo de requisição excedido'
  end
end
