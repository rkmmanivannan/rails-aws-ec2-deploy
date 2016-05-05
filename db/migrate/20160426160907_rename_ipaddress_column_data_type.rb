class RenameIpaddressColumnDataType < ActiveRecord::Migration
  def self.up
    change_column :urlshorts, :ipaddress, :cidr
  end

  def self.down
    change_column :urlshorts, :ipaddress, :inet
  end
end
