class AddStatusToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :status, :string, default: "Not_started"
  end
end
