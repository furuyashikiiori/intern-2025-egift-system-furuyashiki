# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text
#  name        :string
#  price       :integer          not null
#  published   :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Item < ApplicationRecord
  # Active Storage attachment for item image
  has_one_attached :image

  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, length: { maximum: 1000 }
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
