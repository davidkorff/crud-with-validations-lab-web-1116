class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :proper_release_year
  #validates :release_year, presence: true, if: "!name.nil?"
  #validate :released_check
  #validates :release_year, presence: true, length:{maximum: 2017}


  def proper_release_year
    if release_year.to_i == 0 && released == true
      errors.add(:release_year, "year must exist")
    end
    if release_year.to_i > Time.new.year.to_i
      errors.add(:release_year, "can't be in the future")
    end
  end

end
