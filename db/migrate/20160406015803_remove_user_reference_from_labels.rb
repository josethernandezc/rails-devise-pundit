class RemoveUserReferenceFromLabels < ActiveRecord::Migration
  def change
    remove_reference :labels, :user, index: true, foreign_key: true
  end
end
