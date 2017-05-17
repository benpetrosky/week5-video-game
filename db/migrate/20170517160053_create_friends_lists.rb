class CreateFriendsLists < ActiveRecord::Migration[5.1]
  def change
    create_table(:friends_lists) do |t|
      t.column(:friend_id, :integer)
      t.column(:profile_id, :integer)

      t.timestamps()
    end
  end
end
