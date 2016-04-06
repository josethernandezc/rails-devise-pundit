class Label < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :name, :colour, presence: true
  validates :name, uniqueness: { scope: :colour }
end
