class Contact < ApplicationRecord
  belongs_to :user

  def fullname
    "#{firstname} #{lastname}"
  end
end
