class RenameTypeToWorkoutType < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_data, :type, :workout_type
  end
end
