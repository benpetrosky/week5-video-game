class CreateProfileConnections < ActiveRecord::Migration[5.1]
  def change
    create_table "profile_connections", :force => true, :id => false do |t|
      t.integer "profile_a_id", :null => false
      t.integer "profile_b_id", :null => false
    end
  end
end
