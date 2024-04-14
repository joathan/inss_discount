# frozen_string_literal: true

class Contact < ApplicationRecord
  enum :kind, %i[personal reference]

  belongs_to :proponent
end
