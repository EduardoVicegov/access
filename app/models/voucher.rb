class Voucher < ApplicationRecord
  validates :user_name, :token, presence: true

  #KAMINARI
  paginates_per 10
end
