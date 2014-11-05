class CreateTables < ActiveRecord::Migration

  def self.up
    create_table_teams
  end

  def create_table_teams
    create_table :teams, {:primary_key => :id} do |t|
      t.text :name, null: false
      t.timestamps
    end
  end

end