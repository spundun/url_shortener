class CreateShorts < ActiveRecord::Migration
  def change
    create_table :shorts do |t|
      t.text :url

      t.timestamps null: false
    end
  end
end
