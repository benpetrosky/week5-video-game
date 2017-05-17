class RemoveUnnecessaryTables < ActiveRecord::Migration[5.1]
  def change
    drop_table(:friends_profiles)
    remove_column(:friends, :username, :string)
    add_column(:friends, :profile_id, :integer)
    add_column(:friends, :friend_id, :integer)
  end
end
