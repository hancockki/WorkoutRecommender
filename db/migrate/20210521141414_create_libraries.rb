class CreateLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :libraries do |t|
      t.string :url
      t.string :workout_type
      t.string :duration
      t.string :intensity

      t.timestamps
    end
  end
end
