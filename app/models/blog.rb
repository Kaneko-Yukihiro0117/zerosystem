class Blog < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :plan
    validates :start_time
  end
end
