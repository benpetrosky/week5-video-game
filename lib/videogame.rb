class Videogame < ActiveRecord::Base

  has_many :opinions
  has_many :profiles, through: :opinions

  validates :game_name, uniqueness: { case_sensitive: false }
  validates(:game_name, {:presence => true, :length => { :maximum => 100 }})

  before_save(:upcase_name)

  private
  def upcase_name
    self.game_name=(game_name().split.map(&:capitalize).join(' '))
  end
end
