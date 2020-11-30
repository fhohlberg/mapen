# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'http'
require 'json'
Conection.delete_all
#url = 'https://api.desarrolladores.energiaabierta.cl/pequenos-medios-de-generacion-distribuida/v1/pmgd/comunas.json/?auth_key=fGT4wGtIsShjhSJzX8WbL6ugXm3wdVRXMT7kWtYD'
url = 'https://api.desarrolladores.energiaabierta.cl/capacidad-instalada/v1/enoperacion.json/?auth_key=fGT4wGtIsShjhSJzX8WbL6ugXm3wdVRXMT7kWtYD'
info = HTTP.get(url).to_s
lista_res = eval(info)
response = lista_res
#console.log(response)
response[:data].each do |loc|
  """
  Location.create([{sistema: loc[0], 
                    subsistema: loc[1], 
                    propietario: loc[2], 
                    rut: loc[4], 
                    nombre_central: loc[5], 
                    estado: loc[6], 
                    fecha_puesta_servicio_central: loc[7], 
                    comuna: loc[10], 
                    region: loc[9], 
                    clasificacion: loc[16], 
                    tipo_energia: loc[17], 
                    potencia_bruta_mw: loc[18], 
                    potencia_neta_mw: loc[19], 
                    medio_generacion: loc[21], 
                    distribuidora: loc[22], 
                    punto_conexion: loc[23], 
                    combustible: loc[24], 
                    consumo: loc[25], 
                    unidad_consumo: loc[26]}]);
  """
  Conection.create([{sistema: loc[0], 
                    subsistema: loc[1], 
                    propietario: loc[2], 
                    rut: loc[4], 
                    nombre_central: loc[5], 
                    estado: loc[6], 
                    fecha_puesta_servicio_central: loc[7], 
                    comuna: loc[10], 
                    region: loc[9], 
                    clasificacion: loc[16], 
                    tipo_energia: loc[17], 
                    potencia_bruta_mw: loc[18], 
                    potencia_neta_mw: loc[19], 
                    medio_generacion: loc[21], 
                    distribuidora: loc[22], 
                    punto_conexion: loc[23], 
                    combustible: loc[24], 
                    consumo: loc[25], 
                    unidad_consumo: loc[26]}]);
end

"""
url2 = 'https://api.desarrolladores.energiaabierta.cl/pequenos-medios-de-generacion-distribuida/v1/pmgd/comunas.json/?auth_key=fGT4wGtIsShjhSJzX8WbL6ugXm3wdVRXMT7kWtYD'
info = HTTP.get(url2).to_s
lista_res = eval(info)
response = lista_res
#console.log(response)
response[:data].each do |loc|
  Location.create([{comuna: loc[2], region: loc[1], tipo_energia: loc[3], medio_generacion: loc[4], potencia_neta_mw: loc[5]}])
end
"""



