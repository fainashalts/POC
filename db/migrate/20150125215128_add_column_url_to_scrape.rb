class AddColumnUrlToScrape < ActiveRecord::Migration
  def change
    add_column :scrapes, :url, :string
  end
end
