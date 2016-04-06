class Label < ActiveRecord::Base
  validates :name, :colour, presence: true
  validates :name, uniqueness: { scope: :colour, message: "has already been taken with that colour" }
end
