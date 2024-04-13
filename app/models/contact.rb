class Contact < ApplicationRecord
  enum :kind, [ :personal, :reference ]

  belongs_to :proponent
end
