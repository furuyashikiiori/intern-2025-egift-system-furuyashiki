# == Schema Information
#
# Table name: tickets
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  public_key :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :bigint           not null
#  item_id    :bigint           not null
#
# Indexes
#
#  index_tickets_on_brand_id    (brand_id)
#  index_tickets_on_content     (content) UNIQUE
#  index_tickets_on_item_id     (item_id)
#  index_tickets_on_public_key  (public_key) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (item_id => items.id)
#
class Ticket < ApplicationRecord
  belongs_to :brand
  belongs_to :item

  before_create :initialize_public_key

  private

  def initialize_public_key
    self.public_key ||= SecureRandom.uuid
  end
end
