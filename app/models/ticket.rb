# == Schema Information
#
# Table name: tickets
#
#  id         :bigint           not null, primary key
#  uuid       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :bigint           not null
#  item_id    :bigint           not null
#
# Indexes
#
#  index_tickets_on_brand_id  (brand_id)
#  index_tickets_on_item_id   (item_id)
#  index_tickets_on_uuid      (uuid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (item_id => items.id)
#
class Ticket < ApplicationRecord
  belongs_to :brand
  belongs_to :item
end
