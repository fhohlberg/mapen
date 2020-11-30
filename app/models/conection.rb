class Conection < ApplicationRecord
    #geocoded_by :address
    #after_validation :geocode

    def address
        if punto_conexion.include? ("S/E ")
            direc =  punto_conexion.split("S/E ")[1]
        elsif punto_conexion.include? ("HP ") 
            direc = punto_conexion.split("HP ")[1]
        else
            direc = punto_conexion
        end
        [direc, comuna, region, "Chile"].compact.join(', ')
    end

    def coordinates
        url = "https://api.mapbox.com/geocoding/v5/mapbox.places/" 
        url2 = ".json?access_token=pk.eyJ1IjoiZnJhbmhvaGxiZXJnIiwiYSI6ImNraDRkZ21zMzAwOW0yenN6Ymp4bHR2aGQifQ.qI5VsvHPR_akHezVSgUFEA"
        info = HTTP.get(url + address + url2).to_s
        lista_res = eval(info)
        response = lista_res
        if !response.nil?
            resp = response[:features]
        end
        resp[0][:geometry][:coordinates]
    end
    def latitude
        coordinates[1].to_f
    end
    def longitude
        coordinates[0].to_f
    end
end
