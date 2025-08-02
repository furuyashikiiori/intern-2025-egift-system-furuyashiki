# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text
#  name        :string           not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  brand_id    :bigint           not null
#
# Indexes
#
#  index_items_on_brand_id  (brand_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#
class Item < ApplicationRecord
  # Constants
  NAME_MAX_LENGTH = 255
  DESCRIPTION_MAX_LENGTH = 1000

  # Active Storage attachment for item image
  has_one_attached :image

  belongs_to :brand
  has_many :tickets

  # Validations
  validates :name, presence: true, length: { maximum: NAME_MAX_LENGTH }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }
  validate :image_must_be_present
  validate :image_validation

  # Scopes
  scope :active, -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.current)
  end

  private

  def image_must_be_present
    errors.add(:image, :blank) unless image.attached?
  end

  def image_validation
    return unless image.attached?

    # ファイルタイプのチェック
    unless image.blob.content_type.start_with?("image/")
      errors.add(:image, "画像ファイルを選択してください")
      return
    end

    # ファイルサイズのチェック
    if image.blob.byte_size > 5.megabytes
      errors.add(:image, "ファイルサイズは5MB以下にしてください")
    end
  end
end
