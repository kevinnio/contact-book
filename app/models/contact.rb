class Contact < ApplicationRecord
  belongs_to :user

  validates_presence_of %w[firstname lastname telephone]

  def fullname
    "#{firstname} #{lastname}"
  end
end
