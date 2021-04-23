class Strain < ApplicationRecord
  #has_and_belongs_to_many :wines
  has_many :wine_strains
  has_many :wines, through: :wine_strains
end
