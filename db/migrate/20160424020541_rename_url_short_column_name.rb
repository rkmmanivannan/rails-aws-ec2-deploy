class RenameUrlShortColumnName < ActiveRecord::Migration
  def self.up
      rename_column :urlshorts, :encryptedurl, :shorturl
  end

  def self.down
    rename_column :urlshorts, :shorturl, :encryptedurl
  end
end
