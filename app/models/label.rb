class Label < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :name, :colour, presence: true
  validates :name, uniqueness: { scope: :colour, message: "has already been taken with that colour" }
  validates :colour, inclusion: { in: COLOURS["standard"], message: "is not valid" }, if: "colour.present?"
end
