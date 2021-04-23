class Wine < ApplicationRecord
  #has_and_belongs_to_many :strains
  has_many :wine_strains
  has_many :strains, through: :wine_strains

end
