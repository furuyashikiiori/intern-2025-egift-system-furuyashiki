# == Schema Information
#
# Table name: brands
#
#  id         :bigint           not null, primary key
#  domain     :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_brands_on_domain  (domain) UNIQUE
#
class Brand < ApplicationRecord
  has_many :items
  has_many :tickets
  has_many :admin_users
end
