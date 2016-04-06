class Label < ActiveRecord::Base
  validates :name, :colour, presence: true
  validates :name, uniqueness: { scope: :colour, message: "has already been taken with that colour" }
  validates :colour, inclusion: { in: COLOURS["standard"], message: "is not valid" }
end
