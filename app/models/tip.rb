class Tip < ApplicationRecord
  belongs_to :user
  mount_uploader :img, ImgUploaderUploader

  validates :tips_type, presence: true
  validates :country, presence: true
  validates :tips_content, length: { maximum: 200 }
  validate :street_view_url_is_invalid_if_different_to_googlemap

  def street_view_url_is_invalid_if_different_to_googlemap
    errors.add(:street_view, "が無効です。") if street_view.present? && street_view.slice(0..32) != "https://www.google.com/maps/embed"
  end
end
