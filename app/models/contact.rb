class Contact < ApplicationRecord
  def fullname
    "#{firstname} #{lastname}"
  end
end
