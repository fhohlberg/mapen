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

url = 'https://api.desarrolladores.energiaabierta.cl/pequenos-medios-de-generacion-distribuida/v1/pmgd/comunas.json/?auth_key=fGT4wGtIsShjhSJzX8WbL6ugXm3wdVRXMT7kWtYD'
info = HTTP.get(url).to_s
lista_res = eval(info)
response = lista_res
#console.log(response)
response[:data].each do |loc|
  Location.create([{comuna: loc[2], region: loc[1], tipo_energia: loc[3], medio_generacion: loc[4], potencia_neta_mw: loc[5]}])
end
