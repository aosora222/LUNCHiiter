class Comment < ApplicationRecord
  belongs_to :user_id
  belongs_to :lunch_id
end
