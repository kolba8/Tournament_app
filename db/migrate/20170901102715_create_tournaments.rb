class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :city
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
