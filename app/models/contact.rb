class Contact < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  validate :picture_attached
  validates_presence_of %w[firstname lastname telephone]

  def fullname
    "#{firstname} #{lastname}"
  end

  protected

  def picture_attached
    errors.add(:picture, "wasn't provided") unless picture.attached?
  end
end
