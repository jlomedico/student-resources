class ChangeDivisionToConference < ActiveRecord::Migration
  def change
    rename_column :teams, :division, :conference
  end
end
