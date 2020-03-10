class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.string :repeats
      t.string :time_zone
      t.datetime :start_datetime
      t.integer :duration

      t.timestamps
    end
  end
end
