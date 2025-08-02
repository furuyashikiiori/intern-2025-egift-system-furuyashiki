# == Schema Information
#
# Table name: admin_users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  brand_id        :bigint           not null
#
# Indexes
#
#  index_admin_users_on_brand_id  (brand_id)
#  index_admin_users_on_email     (email) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#
class AdminUser < ApplicationRecord
  has_secure_password
  
  belongs_to :brand
end
