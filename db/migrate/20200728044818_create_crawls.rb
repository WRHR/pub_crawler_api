class CreateCrawls < ActiveRecord::Migration[6.0]
  def change
    create_table :crawls do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
