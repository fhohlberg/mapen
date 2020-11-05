json.extract! location, :id, :comuna, :region, :lat, :long, :tipo_energia, :medio_generacion, :potencia_neta_mw, :created_at, :updated_at
json.url location_url(location, format: :json)
