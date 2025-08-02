# frozen_string_literal: true

require "active_storage/engine"

sample_brands = [
  { name: "Planet Cafe", domain: "planet-cafe.intern.e-gift.co" },
  { name: "River Cafe", domain: "river-cafe.intern.e-gift.co" },
]

sample_image_path = Rails.root.join("app", "assets", "images", "sample_item_image.png")

sample_items = [
  { name: "チョコレートギフト", price: 1200, description: "おいしいチョコレートの詰め合わせです。" },
  { name: "フラワーブーケギフト", price: 3000, description: "色とりどりの花束ギフトです。" },
  { name: "コーヒーセットギフト", price: 2000, description: "厳選されたコーヒー豆のセットです。" },
  { name: "スイーツ詰め合わせ", price: 2500, description: "人気スイーツを詰め合わせました。" },
  { name: "紅茶アソートギフト", price: 1500, description: "香り豊かな紅茶のアソートセットです。" }
]

sample_admin_users = [
  { email: "tanaka-hanako@example.com", name: "田中 花子", password: "bd78UsRcUFwR", password_confirmation: "bd78UsRcUFwR" },
  { email: "nakamura-jiro@example.com", name: "中村 次郎", password: "YNgKQBx5RVHt", password_confirmation: "YNgKQBx5RVHt" },
]

sample_brands.each do |attrs|
  Brand.create!(attrs)
  puts "作成しました: #{attrs[:name]} #{attrs[:domain]}"
end

File.open(sample_image_path, "rb") do |image_file|
  sample_items.each do |attrs|
    image_file.rewind
    Item.create!(
      attrs.merge(
        image: {
          io: image_file,
          filename: "sample_item_image.png",
          content_type: "image/png"
        },
        brand_id: Brand.first.id,
      )
    )
    puts "作成しました: #{attrs[:name]} #{attrs[:price]} #{attrs[:description]}"
  end
end

sample_admin_users.each do |attrs|
  AdminUser.create!(
    attrs.merge(
      brand_id: Brand.first.id,
    )
  )
  puts "作成しました: #{attrs[:email]} #{attrs[:name]}"
end
