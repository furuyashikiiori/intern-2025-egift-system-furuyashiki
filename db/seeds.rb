# frozen_string_literal: true

require "active_storage/engine"

seeds = [
  {
    brand_name: "Planet Cafe",
    brand_domain: "planet-cafe.intern-giftee.e-gift.co",
    admin_users: [
      { email: "sato-kenta@example.com", name: "佐藤 健太", password: "YNgKQBx5RVHt", password_confirmation: "YNgKQBx5RVHt" },
      { email: "yamada-ayaka@example.com", name: "山田 彩花", password: "bd78UsRcUFwR", password_confirmation: "bd78UsRcUFwR" },
    ],
    items: [
      {
        name: "コーヒーセットギフト",
        price: 2000,
        description: "厳選されたコーヒー豆のセットです。",
        image_filename: "item-coffee-set.png",
      },
      {
        name: "紅茶アソートギフト",
        price: 1200,
        description: "香り豊かな紅茶のアソートセットです。",
        image_filename: "item-tea-assort.png",
      },
    ],
  },
  {
    brand_name: "Venus Flower Shop",
    brand_domain: "venus-flower-shop.intern-giftee.e-gift.co",
    admin_users: [
      { email: "ito-kaito@example.com", name: "伊藤 海斗", password: "UcCKxtDXqd3U", password_confirmation: "UcCKxtDXqd3U" },
      { email: "saito-kana@example.com", name: "斎藤 佳奈", password: "pt8mA8fcBtBK", password_confirmation: "pt8mA8fcBtBK" },
    ],
    items: [
      {
        name: "フラワーブーケギフト",
        price: 3000,
        description: "色とりどりの花束ギフトです。",
        image_filename: "item-flower-bouquet.png",
      },
      {
        name: "季節のアレンジメントギフト",
        price: 1200,
        description: "旬の花を楽しめます。",
        image_filename: "item-seasonal-arrangement.png",
      },
    ],
  },
  {
    brand_name: "Jupiter Steak House",
    brand_domain: "jupiter-steak-house.intern-giftee.e-gift.co",
    admin_users: [
      { email: "yoshida-yui@example.com", name: "吉田 結衣", password: "9yGTmAAZry", password_confirmation: "9yGTmAAZry" },
      { email: "kobayashi-tomoya@example.com", name: "小林 智也", password: "nLsbVszhv9", password_confirmation: "nLsbVszhv9" },
    ],
    items: [
      {
        name: "特選黒毛和牛ステーキ",
        price: 10800,
        description: "極上の柔らかさが魅力です。",
        image_filename: "item-wagyu.png",
      },
      {
        name: "贅沢ヒレステーキセット",
        price: 13500,
        description: "上品な赤身が楽しめます。",
        image_filename: "item-steak-set.png",
      },
    ],
  },
]

seeds.each do |seed|
  brand = Brand.create!(
    name: seed[:brand_name],
    domain: seed[:brand_domain],
  )

  admin_user_seeds = seed[:admin_users]
  admin_user_seeds.each do |admin_user_seed|
    AdminUser.create!(
      brand_id: brand.id,
      name: admin_user_seed[:name],
      email: admin_user_seed[:email],
      password: admin_user_seed[:password],
      password_confirmation: admin_user_seed[:password_confirmation],
    )
  end

  item_seeds = seed[:items]
  item_seeds.each do |item_seed|
    Item.create!(
      brand_id: brand.id,
      name: item_seed[:name],
      price: item_seed[:price],
      description: item_seed[:description],
      image: {
        io: File.open(Rails.root.join("app", "assets", "images", item_seed[:image_filename])),
        filename: item_seed[:image_filename],
        content_type: "image/png",
      },
    )
  end

  puts "作成しました: #{seed[:brand_name]}: #{seed[:brand_domain]}"
end
