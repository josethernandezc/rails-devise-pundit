class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false
      t.string :colour, null: false


      t.timestamps null: false
    end
  end
end
