class Tip < ApplicationRecord
  belongs_to :user

  validates :tips_type, presence: true
  validates :country, presence: true
  validates :tips_content, length: { maximum: 200 }
end
