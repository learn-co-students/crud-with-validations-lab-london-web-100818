class Song < ActiveRecord::Base
    validates :title, :artist_name, presence: true
    validates :release_year, presence: true, if: :released?
    
    validates :release_year, numericality: { less_than_or_equal_to: 2018 }, allow_nil: true

    validates :title, uniqueness: true, if: :same_old_same_old
    
    def same_old_same_old
        Song.all.any? {|s|
        artist_name == s.artist_name &&
        release_year == s.release_year} 
    end

end
