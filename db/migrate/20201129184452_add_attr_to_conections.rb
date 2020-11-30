class AddAttrToConections < ActiveRecord::Migration[5.2]
  def change
    add_column :conections, :sistema, :string
    add_column :conections, :subsistema, :string
    add_column :conections, :propietario, :string
    add_column :conections, :rut, :string
    add_column :conections, :nombre_central, :string
    add_column :conections, :estado, :string
    add_column :conections, :fecha_puesta_servicio_central, :string
    add_column :conections, :clasificacion, :string
    add_column :conections, :potencia_neta_mw, :string
    add_column :conections, :potencia_bruta_mw, :string
    add_column :conections, :distribuidora, :string
    add_column :conections, :punto_conexion, :string
    add_column :conections, :combustible, :string
    add_column :conections, :consumo, :string
    add_column :conections, :unidad_consumo, :string
    add_column :conections, :comuna, :string
    add_column :conections, :region, :string
    add_column :conections, :latitude, :float
    add_column :conections, :longitude, :float
    add_column :conections, :tipo_energia, :string
    add_column :conections, :medio_generacion, :string
  end
end
