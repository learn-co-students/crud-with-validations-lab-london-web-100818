class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :released, inclusion: { in:  [true, false] }
    validates :released, exclusion: { in:  [nil] }
    validates :release_year, presence: true, if: :released, numericality: {only_integer: true, less_than_or_equal_to: Time.new.year }
    validate :new_release

    def new_release
        if self.title
            unless Song.find_by(title: self.title, release_year: self.release_year) == nil
                self.errors[:title] << 'You cannot release the same song twice in a year.'
            end
        end
    end

    def released?
        if self.released == true
             "yes" 
        else
             "no"
        end
    end

   
end


