class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :sistema
      t.string :subsistema
      t.string :propietario
      t.string :rut
      t.string :nombre_central
      t.string :estado
      t.string :fecha_puesta_servicio_central
      t.string :clasificacion
      t.string :potencia_neta_mw
      t.string:potencia_bruta_mw
      t.string :distribuidora
      t.string :punto_conexion
      t.string :combustible
      t.string :consumo
      t.string :unidad_consumo
      t.string :comuna
      t.string :region
      t.float :latitude
      t.float :longitude
      t.string :tipo_energia
      t.string :medio_generacion

      t.timestamps
    end
  end
end


