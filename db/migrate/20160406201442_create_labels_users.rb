class CreateLabelsUsers < ActiveRecord::Migration
  def change
    create_table :labels_users do |t|
      t.belongs_to :label, index: true
      t.belongs_to :user, index: true
    end
  end
end
