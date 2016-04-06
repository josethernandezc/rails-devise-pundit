class Label < ActiveRecord::Base
  validates :user_id, :name, :colour, presence: true
  validates :name, uniqueness: { scope: :colour }
end
