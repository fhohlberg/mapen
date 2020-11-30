class CreateConections < ActiveRecord::Migration[5.2]
  def change
    create_table :conections do |t|
      
      t.timestamps
    end
  end
end
