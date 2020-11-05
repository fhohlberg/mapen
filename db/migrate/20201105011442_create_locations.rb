class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :comuna
      t.string :region
      t.float :latitude
      t.float :longitude
      t.string :tipo_energia
      t.string :medio_generacion
      t.float :potencia_neta_mw

      t.timestamps
    end
  end
end
