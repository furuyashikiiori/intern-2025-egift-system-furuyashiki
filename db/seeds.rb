# frozen_string_literal: true

# This seed script creates initial Item records for the application.
# 同じデータが複数回作成されないように、find_or_initialize_by で取得・生成し、
# 既に存在する場合は更新のみ行います。

require "active_storage/engine"

SAMPLE_IMAGE_PATH = Rails.root.join("app", "assets", "images", "sample_item_image.png")


items = [
  { name: "チョコレートギフト", price: 1200, description: "おいしいチョコレートの詰め合わせです。" },
  { name: "フラワーブーケギフト", price: 3000, description: "色とりどりの花束ギフトです。" },
  { name: "コーヒーセットギフト", price: 2000, description: "厳選されたコーヒー豆のセットです。" },
  { name: "スイーツ詰め合わせ", price: 2500, description: "人気スイーツを詰め合わせました。" },
  { name: "紅茶アソートギフト", price: 1500, description: "香り豊かな紅茶のアソートセットです。" }
]

items.each do |attrs|
  item = Item.find_or_initialize_by(name: attrs[:name])
  item.assign_attributes(attrs)

  unless item.image.attached?
    item.image.attach(
      io: File.open(SAMPLE_IMAGE_PATH),
      filename: "sample_item_image.png",
      content_type: "image/png"
    )
  end

  item.save!
end
