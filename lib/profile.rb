class Profile < ActiveRecord::Base
  has_and_belongs_to_many(:profiles,
    :join_table => "profile_connections",
    :foreign_key => "profile_a_id",
    :association_foreign_key => "profile_b_id")

  has_many :opinions
  has_many :videogames, through: :opinions

end
