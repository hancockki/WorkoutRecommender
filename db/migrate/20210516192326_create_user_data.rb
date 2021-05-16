class CreateUserData < ActiveRecord::Migration[6.1]
  def change
    create_table :user_data do |t|
      t.string :name
      t.float :age
      t.string :workout_type
      t.string :duration
      t.string :intensity

      t.timestamps
    end
  end
end
