class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :store_name
    validates :detail
    validates :category_id, numericality: { other_than: 0 }
    validates :image,       length: { minimum: 1 }
      # 半角数字のみ許可する
      with_options format: { with: /\A[-]?[0-9]{1,3}\.[0-9]{1,7}\z/u } do
    validates :latitude
    validates :longitude
    end
  end
end
