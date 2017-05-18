class CreateEncryptedpassword < ActiveRecord::Migration[5.1]
  def change
    add_column(:profiles, :encrypted_password, :string)
  end
end
