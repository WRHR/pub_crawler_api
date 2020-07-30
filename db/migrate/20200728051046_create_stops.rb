class CreateStops < ActiveRecord::Migration[6.0]
  def change
    create_table :stops do |t|
      t.references :crawl, null: false, foreign_key: true
      t.integer :brewery_id
      t.string :pub_name
      t.string :pub_address
      t.float :brewery_latitude
      t.float :brewery_longitude
      t.string :website

      t.timestamps
    end
  end
end
