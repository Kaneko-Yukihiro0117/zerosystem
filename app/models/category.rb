class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: 'ーー' },
    { id: 1, name: '和菓子' },
    { id: 2, name: '洋菓子' },
    { id: 3, name: 'ケーキ' },
    { id: 4, name: '和食' },
    { id: 5, name: '寿司' },
    { id: 6, name: '洋食' },
    { id: 7, name: '魚の料理' },
    { id: 8, name: '肉の料理' },
    { id: 9, name: '飲み物・ワイン・お酒' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :shops
end
