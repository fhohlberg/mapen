class AddAttrToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :sistema, :string
    add_column :locations, :subsistema, :string
    add_column :locations, :propietario, :string
    add_column :locations, :rut, :string
    add_column :locations, :nombre_central, :string
    add_column :locations, :estado, :string
    add_column :locations, :fecha_puesta_servicio_central, :string
    add_column :locations, :clasificacion, :string
    add_column :locations, :potencia_neta_mw, :string
    add_column :locations, :potencia_bruta_mw, :string
    add_column :locations, :distribuidora, :string
    add_column :locations, :punto_conexion, :string
    add_column :locations, :combustible, :string
    add_column :locations, :consumo, :string
    add_column :locations, :unidad_consumo, :string
    add_column :locations, :comuna, :string
    add_column :locations, :region, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
    add_column :locations, :tipo_energia, :string
    add_column :locations, :medio_generacion, :string
  end
end
