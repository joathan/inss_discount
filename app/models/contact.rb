# frozen_string_literal: true

# Path: app/models/contact.rb
class Contact < ApplicationRecord
  enum :kind, %i[personal reference]

  belongs_to :proponent
end
