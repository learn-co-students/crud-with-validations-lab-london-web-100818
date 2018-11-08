class ChangeReleaseYearDataType < ActiveRecord::Migration
  def change
    change_column :songs, :release_year, :string
  end
end
